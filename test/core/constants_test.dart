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
  });
}
