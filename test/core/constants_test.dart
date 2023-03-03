import 'package:alyamamah/core/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Constants |', () {
    test(
      'verify padding value.',
      () {
        expect(Constants.padding, 16);
      },
    );

    test(
      'verify spacing value.',
      () {
        expect(Constants.spacing, Constants.padding / 2);
      },
    );

    test(
      'verify usernameKey value.',
      () {
        expect(Constants.usernameKey, 'username');
      },
    );

    test(
      'verify passwordKey value.',
      () {
        expect(Constants.passwordKey, 'password');
      },
    );

    test(
      'verify apiUrl value.',
      () {
        expect(Constants.apiUrl, 'https://edugate.yu.edu.sa/yu');
      },
    );
  });
}
