import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/core/services/yu_api/interceptors/yu_api_auth_interceptor.dart';
import 'package:alyamamah/core/services/yu_api/interceptors/yu_api_demo_mode_interceptor.dart';
import 'package:alyamamah/core/services/yu_api/models/chat.dart';
import 'package:alyamamah/core/services/yu_api/models/model_name.dart';
import 'package:alyamamah/core/services/yu_api/yu_api_service_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:sentry_dio/sentry_dio.dart';

final yuApiServiceProvider = Provider((ref) {
  return YuApiService(
    dio: Dio(),
    yuApiDemoModeInterceptor: YuApiDemoModeInterceptor(),
    yuApiAuthInterceptor: YuApiAuthInterceptor(
      sharedPrefsService: ref.read(sharedPrefsServiceProvider),
    ),
  );
});

class YuApiService {
  final _log = Logger('YuApiService');

  final Dio _dio;
  final YuApiDemoModeInterceptor _yuApiDemoModeInterceptor;
  final YuApiAuthInterceptor _yuApiAuthInterceptor;

  YuApiService({
    required Dio dio,
    required YuApiDemoModeInterceptor yuApiDemoModeInterceptor,
    required YuApiAuthInterceptor yuApiAuthInterceptor,
  })  : _dio = dio,
        _yuApiDemoModeInterceptor = yuApiDemoModeInterceptor,
        _yuApiAuthInterceptor = yuApiAuthInterceptor {
    _dio.options = BaseOptions(
      baseUrl: Constants.yuApiBaseUrl,

      /// This is needed only when testing locally
      /// and using ngrok to route traffic to your local instance of the server.
      // headers: {
      //   'ngrok-skip-browser-warning': 'lol',
      // },
    );

    /// This interceptor has an activation path and activation credentials,
    /// once triggered it will start faking all responses. This is useful for
    /// testing purposes.
    _dio.interceptors.add(_yuApiDemoModeInterceptor);

    _dio.interceptors.add(_yuApiAuthInterceptor);

    /// This must be the last step always.
    _dio.addSentry();
  }

  /// Returns an access token.
  Future<String> login({
    required String username,
    required String password,
    required String fcmToken,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: {
          'username': username,
          'password': password,
          'fcmToken': fcmToken,
        },
      );

      if (response.statusCode == 200 &&
          response.data['accessToken'] != null &&
          response.data['message'] == null) {
        return response.data['accessToken'];
      }

      _log.severe('login | something weird went wrong.');
      throw const YuApiServiceException();
    } on DioException catch (e) {
      _log.severe('login | dio error: $e.');

      if (e.response?.statusCode == 401) {
        _log.severe('login | invalid credentials.');
        throw const YuApiServiceException(
          YuApiServiceExceptionType.invalidCredentials,
        );
      }

      throw const YuApiServiceException();
    } catch (e) {
      if (e is YuApiServiceException) rethrow;

      _log.severe('login | unexpected exception: $e.');
      throw const YuApiServiceException();
    }
  }

  /// Streams the tokens as they are received from the server.
  Stream<String> chat({
    required List<Chat> chats,
    required ModelName modelName,
  }) async* {
    try {
      final response = await _dio.get<ResponseBody>(
        '/chat',
        data: {
          'chatList': chats.map((e) => e.toMap()).toList(),
          'modelName': modelName.name,
        },
        options: Options(
          responseType: ResponseType.stream,
        ),
      );

      if (response.statusCode == 402) {
        _log.severe('chat | payment required');
        throw const YuApiServiceException(
          YuApiServiceExceptionType.paymentRequired,
        );
      }

      final unit8Transformer =
          StreamTransformer<Uint8List, List<int>>.fromHandlers(
        handleData: (data, sink) {
          sink.add(List<int>.from(data));
        },
      );

      if (response.data != null) {
        yield* response.data!.stream
            .transform(unit8Transformer)
            .transform(const Utf8Decoder())
            .transform(ChatResponseTransformer());
        return;
      }

      throw const YuApiServiceException();
    } on DioException catch (e) {
      final body = e.response?.data as ResponseBody?;

      if (e.response?.statusCode == 401) {
        _log.severe('chat | invalid credentials.');
        throw const YuApiServiceException(
          YuApiServiceExceptionType.invalidCredentials,
        );
      }

      if (e.response?.statusCode == 400) {
        _log.severe('chat | invalid request');

        final bodyBytes = (await body?.stream.first);
        if (bodyBytes != null) {
          final bodyString = String.fromCharCodes(bodyBytes.toList());
          _log.severe('chat | body: $bodyString');
          final bodyMap = jsonDecode(bodyString) as Map<String, dynamic>;

          if (bodyMap['errorCode'] == 'user-is-generating') {
            throw const YuApiServiceException(
              YuApiServiceExceptionType.userIsGenerating,
            );
          } else if (bodyMap['errorCode'] == 'context-length-exceeded') {
            throw const YuApiServiceException(
              YuApiServiceExceptionType.contextLengthExceeded,
            );
          }
        }

        throw const YuApiServiceException(
          YuApiServiceExceptionType.invalidRequest,
        );
      }

      if (e.response?.statusCode == 402) {
        _log.severe('chat | payment required');
        throw const YuApiServiceException(
          YuApiServiceExceptionType.paymentRequired,
        );
      }

      if (e.response?.statusCode == 429) {
        _log.severe('chat | too many requests.');
        throw const YuApiServiceException(
          YuApiServiceExceptionType.tooManyRequests,
        );
      }
    } catch (e) {
      if (e is YuApiServiceException) rethrow;

      _log.severe('chat | unexpected exception: $e.');
      throw const YuApiServiceException();
    }
  }
}

class ChatResponseTransformer extends StreamTransformerBase<String, String> {
  @override
  Stream<String> bind(Stream<String> stream) {
    return stream.expand((event) {
      final List<String> multipleEvents =
          event.split(RegExp(r'(?<=})\s*(?={)'));
      return multipleEvents.map((singleEvent) {
        final Map<String, dynamic> eventMap = jsonDecode(singleEvent);
        final Map<String, dynamic> dataMap =
            eventMap['data'] as Map<String, dynamic>;
        return dataMap['data'] as String;
      });
    });
  }
}
