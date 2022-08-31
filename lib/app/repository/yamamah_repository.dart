import 'dart:convert';

import 'package:alyamamah/app/provider/locale_provider.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';

final yamamahRepositoryProvider = Provider(
  (ref) => YamamahRepository(
    client: Dio(),
    ref: ref,
  ),
);

class YamamahRepository {
  static final logger = Logger('YamamahRepository');

  YamamahRepository({
    required Dio client,
    required Ref ref,
  })  : _client = client,
        _ref = ref {
    client.interceptors.add(CookieManager(CookieJar()));
  }

  final Dio _client;
  final Ref _ref;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final languageCode = _ref.read(localeProvider).languageCode;
      logger.info("language $languageCode");

      final authorizationEncoded = base64Encode(
        '$username:$password'.runes.toList(),
      );
      logger.info('username: $username | password: $password');

      final response = await _client.get<Map<String, dynamic>>(
        'https://edugate.yu.edu.sa/yu/resources/common/commonServies/actorDetails/1/1/1',
        options: Options(
          headers: {
            'Authorization': 'Basic $authorizationEncoded',
            'langId': languageCode == 'ar' ? '1' : '0',
          },
        ),
      );
      logger.info('response status code: ${response.statusCode}');
      logger.info("response: ${response.data.toString().substring(0, 50)}");

      final bodyDecoded = response.data!;
      if (bodyDecoded['commonInfo']['status'] == false) {
        logger.severe('response is bad');
        throw YamamahException(bodyDecoded['commonInfo']['msg']);
      }

      if (!response.headers.map.containsKey('set-cookie')) {
        logger.severe('no set-cookie header');
        throw YamamahException();
      }
    } catch (e) {
      logger.severe('error in login: $e');
      if (e is YamamahException) {
        rethrow;
      }

      throw YamamahException();
    }
  }
}

class YamamahException implements Exception {
  final String message;

  YamamahException([this.message = '']);
}
