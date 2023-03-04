import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  group('sharedPreferencesProvider |', () {
    test(
      'should return an instance of SharedPreferences.',
      () {
        final container = ProviderContainer();

        expect(
          () => container.read(sharedPreferencesProvider),
          throwsA(isA<UnimplementedError>()),
        );
      },
    );
  });

  group('SharedPrefsService |', () {
    late MockSharedPreferences mockSharedPreferences;
    late SharedPrefsService sharedPrefsService;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();

      sharedPrefsService = SharedPrefsService(
        sharedPreferences: mockSharedPreferences,
      );
    });

    group('getUsername |', () {
      test(
        'should get null string if getString returns null.',
        () {
          when(
            () => mockSharedPreferences.getString(Constants.usernameKey),
          ).thenReturn(null);

          final result = sharedPrefsService.getUsername();

          expect(result, null);
          verify(
            () => mockSharedPreferences.getString(Constants.usernameKey),
          ).called(1);
        },
      );

      test(
        'should get some string if getString returns some string.',
        () {
          when(
            () => mockSharedPreferences.getString(Constants.usernameKey),
          ).thenReturn('some');

          final result = sharedPrefsService.getUsername();

          expect(result, 'some');
          verify(
            () => mockSharedPreferences.getString(Constants.usernameKey),
          ).called(1);
        },
      );
    });

    group('getPassword |', () {
      test(
        'should get null string if getString returns null.',
        () {
          when(
            () => mockSharedPreferences.getString(Constants.passwordKey),
          ).thenReturn(null);

          final result = sharedPrefsService.getPassword();

          expect(result, null);
          verify(
            () => mockSharedPreferences.getString(Constants.passwordKey),
          ).called(1);
        },
      );

      test(
        'should get some string if getString returns some string.',
        () {
          when(
            () => mockSharedPreferences.getString(Constants.passwordKey),
          ).thenReturn('some');

          final result = sharedPrefsService.getPassword();

          expect(result, 'some');
          verify(
            () => mockSharedPreferences.getString(Constants.passwordKey),
          ).called(1);
        },
      );
    });

    group('saveUsernameAndPassword |', () {
      test(
        'should call setString for username and password.',
        () async {
          when(
            () => mockSharedPreferences.setString(
              Constants.usernameKey,
              'username',
            ),
          ).thenAnswer((_) => Future<bool>.value(true));
          when(
            () => mockSharedPreferences.setString(
              Constants.passwordKey,
              'password',
            ),
          ).thenAnswer((_) => Future<bool>.value(true));

          await sharedPrefsService.saveUsernameAndPassword(
            username: 'username',
            password: 'password',
          );

          verify(
            () => mockSharedPreferences.setString(
              Constants.usernameKey,
              'username',
            ),
          ).called(1);
          verify(
            () => mockSharedPreferences.setString(
              Constants.passwordKey,
              'password',
            ),
          ).called(1);
        },
      );
    });

    group('deleteUsernameAndPassword |', () {
      test(
        'should call remove for username and password.',
        () async {
          when(
            () => mockSharedPreferences.remove(Constants.usernameKey),
          ).thenAnswer((_) => Future<bool>.value(true));
          when(
            () => mockSharedPreferences.remove(Constants.passwordKey),
          ).thenAnswer((_) => Future<bool>.value(true));

          await sharedPrefsService.deleteUsernameAndPassword();

          verify(
            () => mockSharedPreferences.remove(Constants.usernameKey),
          ).called(1);
          verify(
            () => mockSharedPreferences.remove(Constants.passwordKey),
          ).called(1);
        },
      );
    });

    group('getLocale |', () {
      test(
        'should get null string if getString returns null.',
        () {
          when(
            () => mockSharedPreferences.getString(Constants.localeKey),
          ).thenReturn(null);

          final result = sharedPrefsService.getLocale();

          expect(result, null);
          verify(
            () => mockSharedPreferences.getString(Constants.localeKey),
          ).called(1);
        },
      );

      test(
        'should get some string if getString returns some string.',
        () {
          when(
            () => mockSharedPreferences.getString(Constants.localeKey),
          ).thenReturn('some');

          final result = sharedPrefsService.getLocale();

          expect(result, 'some');
          verify(
            () => mockSharedPreferences.getString(Constants.localeKey),
          ).called(1);
        },
      );
    });

    group('saveLocale |', () {
      test(
        'should call setString for locale.',
        () async {
          when(
            () => mockSharedPreferences.setString(
              Constants.localeKey,
              'locale',
            ),
          ).thenAnswer((_) => Future<bool>.value(true));

          await sharedPrefsService.saveLocale('locale');

          verify(
            () => mockSharedPreferences.setString(
              Constants.localeKey,
              'locale',
            ),
          ).called(1);
        },
      );
    });

    group('deleteLocale |', () {
      test(
        'should call remove for locale.',
        () async {
          when(
            () => mockSharedPreferences.remove(Constants.localeKey),
          ).thenAnswer((_) => Future<bool>.value(true));

          await sharedPrefsService.deleteLocale();

          verify(
            () => mockSharedPreferences.remove(Constants.localeKey),
          ).called(1);
        },
      );
    });
  });
}

class MockSharedPreferences extends Mock implements SharedPreferences {}
