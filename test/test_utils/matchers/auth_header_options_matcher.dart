import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

class AuthHeaderOptionsMatcher extends Matcher {
  final String headerValue;

  AuthHeaderOptionsMatcher({
    required this.headerValue,
  });

  @override
  Description describe(Description description) {
    return description;
  }

  @override
  bool matches(item, Map matchState) {
    return item is Options && item.headers?['Authorization'] == headerValue;
  }
}
