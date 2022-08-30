import 'dart:convert';

import 'package:alyamamah/app/misc/constants.dart';
import 'package:http/http.dart';
import 'package:logging/logging.dart';
import 'package:shared_preferences/shared_preferences.dart';

class YamamahRepository {
  static final log = Logger('YamamahRepository');

  const YamamahRepository({
    required Client client,
  }) : _client = client;

  final Client _client;

  Future<void> login({
    required String username,
    required String password,
  }) async {
    try {
      final authorizationEncoded = base64Encode(
        '$username:$password'.runes.toList(),
      );
      log.fine('username: $username | password: $password');

      final response = await _client.get(
        Uri.parse(
          'https://edugate.yu.edu.sa/yu/resources/common/commonServies/actorDetails/1/1/1',
        ),
        headers: {
          'Authorization': 'Basic $authorizationEncoded',
        },
      );
      log.fine('response status code: ${response.statusCode}');
      log.fine("response: ${response.body.substring(0, 50)}");

      if (response.statusCode != 200) {
        log.severe('response is bad, not 200: ${response.statusCode}');
        throw YamamahException();
      }

      if (!response.headers.containsKey('set-cookie')) {
        log.severe('no set-cookie header');
        throw YamamahException();
      }

      final setCookie = response.headers['set-cookie']!;
      log.fine('setCookie: $setCookie');
      final jSessionIdRegExp = RegExp('JSESSIONID=(.*?);');
      final jSessionIdMatch = jSessionIdRegExp.firstMatch(setCookie);
      final jSessionId = jSessionIdMatch?.group(1);
      log.fine('jSessionId: $jSessionId');
      if (jSessionId != null) {
        final sharedPrefs = await SharedPreferences.getInstance();
        await sharedPrefs.setString(
          Constants.jSessionIdKey,
          jSessionId,
        );
      }
    } catch (e) {
      log.severe('error in login: $e');
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
