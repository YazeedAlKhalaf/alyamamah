import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/ui/views/login/login_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('loginViewModelProvider |', () {
    test(
      'verify provider type.',
      () {
        expect(
          loginViewModelProvider,
          isA<ChangeNotifierProvider<LoginViewModel>>(),
        );
      },
    );
  });

  group('LoginViewModel |', () {
    late MockApiService mockApiService;
    late MockSharedPrefsService mockSharedPrefsService;
    late MockYURouter mockYURouter;
    late MockActorDetailsNotifier mockActorDetailsNotifier;

    late LoginViewModel loginViewModel;
    late int notifyListenersCount = 0;

    setUp(() {
      mockApiService = MockApiService();
      mockSharedPrefsService = MockSharedPrefsService();
      mockYURouter = MockYURouter();
      mockActorDetailsNotifier = MockActorDetailsNotifier();

      loginViewModel = LoginViewModel(
        apiService: mockApiService,
        sharedPrefsService: mockSharedPrefsService,
        yuRouter: mockYURouter,
        actorDetailsNotifier: mockActorDetailsNotifier,
      );

      notifyListenersCount = 0;
      loginViewModel.addListener(() {
        notifyListenersCount++;
      });
    });

    tearDown(() {
      verifyNoMoreInteractions(mockApiService);
      verifyNoMoreInteractions(mockSharedPrefsService);
      verifyNoMoreInteractions(mockYURouter);
      verifyNoMoreInteractions(mockActorDetailsNotifier);
    });

    group('onUsernameChanged |', () {
      test(
        'should set username.',
        () {
          expect(loginViewModel.username, '');

          loginViewModel.onUsernameChanged('username');

          expect(loginViewModel.username, 'username');
          expect(notifyListenersCount, 1);
        },
      );
    });

    group('onPasswordChanged |', () {
      test(
        'should set password.',
        () {
          expect(loginViewModel.password, '');

          loginViewModel.onPasswordChanged('password');

          expect(loginViewModel.password, 'password');
          expect(notifyListenersCount, 1);
        },
      );
    });

    group('toggleShowPassword |', () {
      test(
        'should change showPassword to true if it was false.',
        () {
          expect(loginViewModel.showPassword, false);

          loginViewModel.toggleShowPassword();

          expect(loginViewModel.showPassword, true);
          expect(notifyListenersCount, 1);
        },
      );

      test(
        'should change showPassword to false if it was true.',
        () {
          expect(loginViewModel.showPassword, false);

          loginViewModel.toggleShowPassword();

          expect(loginViewModel.showPassword, true);
          expect(notifyListenersCount, 1);

          loginViewModel.toggleShowPassword();

          expect(loginViewModel.showPassword, false);
          expect(notifyListenersCount, 2);
        },
      );
    });

    group('login |', () {
      test(
        'should login, save username and password, '
        'and push and pop until main route.',
        () async {
          final fakeActorDetails = FakeActorDetails();
          when(
            () => mockApiService.login(
              username: '',
              password: '',
            ),
          ).thenAnswer(
            (_) => Future<ActorDetails>.value(fakeActorDetails),
          );
          when(() => mockSharedPrefsService.getLocale())
              .thenAnswer((_) => 'en');
          when(
            () => mockApiService.changeLanguage(
              changeLanguageLocale: ChangeLanguageLocale.english,
            ),
          ).thenAnswer((_) => Future.value(false));
          when(
            () => mockSharedPrefsService.saveUsernameAndPassword(
              username: '',
              password: '',
            ),
          ).thenAnswer((_) => Future<void>.value());
          when(
            () => mockYURouter.pushAndPopUntil(
              MainRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).thenAnswer((_) => Future.value());

          await loginViewModel.login();

          verify(
            () => mockApiService.login(
              username: '',
              password: '',
            ),
          ).called(2);
          verify(() => mockSharedPrefsService.getLocale()).called(1);
          verify(
            () => mockApiService.changeLanguage(
              changeLanguageLocale: ChangeLanguageLocale.english,
            ),
          ).called(1);
          verify(
            () => mockActorDetailsNotifier.setActorDetails(fakeActorDetails),
          ).called(1);
          verify(
            () => mockSharedPrefsService.saveUsernameAndPassword(
              username: '',
              password: '',
            ),
          ).called(1);
          verify(
            () => mockYURouter.pushAndPopUntil(
              MainRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).called(1);

          expect(notifyListenersCount, 2);
        },
      );

      test(
        'should check apiServiceExceptionType is invalidCredentials '
        'when login throws an exception.',
        () async {
          when(
            () => mockApiService.login(
              username: '',
              password: '',
            ),
          ).thenThrow(
            const ApiServiceException(
              ApiServiceExceptionType.invalidCredentials,
            ),
          );

          await loginViewModel.login();

          verify(
            () => mockApiService.login(
              username: '',
              password: '',
            ),
          ).called(1);
          verifyNever(
            () => mockSharedPrefsService.saveUsernameAndPassword(
              username: '',
              password: '',
            ),
          );
          verifyNever(
            () => mockYURouter.pushAndPopUntil(
              MainRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          );

          expect(
            loginViewModel.apiServiceExceptionType,
            ApiServiceExceptionType.invalidCredentials,
          );
          expect(notifyListenersCount, 3);
        },
      );
    });
  });
}

class MockApiService extends Mock implements ApiService {}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}

class MockYURouter extends Mock implements YURouter {}

class FakeActorDetails extends Fake implements ActorDetails {}

class MockActorDetailsNotifier extends Mock implements ActorDetailsNotifier {}
