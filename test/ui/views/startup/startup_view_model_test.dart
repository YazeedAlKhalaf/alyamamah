import 'package:alyamamah/core/models/actor_details.dart';
import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/ui/views/startup/startup_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('StartupViewModel |', () {
    late MockApiService mockApiService;
    late MockSharedPrefsService mockSharedPrefsService;
    late MockYURouter mockYURouter;
    late MockActorDetailsNotifier mockActorDetailsNotifier;

    late StartupViewModel startupViewModel;

    setUp(() {
      registerFallbackValue(FakePageRouteInfo());

      mockApiService = MockApiService();
      mockSharedPrefsService = MockSharedPrefsService();
      mockYURouter = MockYURouter();
      mockActorDetailsNotifier = MockActorDetailsNotifier();

      startupViewModel = StartupViewModel(
        apiService: mockApiService,
        sharedPrefsService: mockSharedPrefsService,
        yuRouter: mockYURouter,
        actorDetailsNotifier: mockActorDetailsNotifier,
      );
    });

    group('handleStartup |', () {
      test(
        'verify methods that are called '
        'when handleStartup succeeds with no exception.',
        () async {
          when(() => mockSharedPrefsService.getUsername())
              .thenReturn('username');
          when(() => mockSharedPrefsService.getPassword())
              .thenReturn('password');
          when(
            () => mockApiService.login(
              username: 'username',
              password: 'password',
            ),
          ).thenAnswer((_) => Future.value(FakeActorDetails()));
          when(() => mockSharedPrefsService.getLocale()).thenReturn('en');
          when(
            () => mockApiService.changeLanguage(
              changeLanguageLocale: ChangeLanguageLocale.english,
            ),
          ).thenAnswer((_) => Future.value(true));
          when(
            () => mockYURouter.pushAndPopUntil(
              MainRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).thenAnswer((_) => Future.value());

          await startupViewModel.handleStartup();

          verify(() => mockSharedPrefsService.getUsername()).called(1);
          verify(() => mockSharedPrefsService.getPassword()).called(1);
          verify(
            () => mockApiService.login(
              username: 'username',
              password: 'password',
            ),
          ).called(2);
          verify(() => mockSharedPrefsService.getLocale()).called(1);
          verify(
            () => mockApiService.changeLanguage(
              changeLanguageLocale: ChangeLanguageLocale.english,
            ),
          ).called(1);
          verify(
            () => mockYURouter.pushAndPopUntil(
              MainRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).called(1);
        },
      );

      test(
        'verify methods that are called '
        'when handleStartup fails with ApiServiceException exception.',
        () async {
          when(() => mockSharedPrefsService.getUsername())
              .thenReturn('username');
          when(() => mockSharedPrefsService.getPassword())
              .thenReturn('password');
          when(
            () => mockApiService.login(
              username: 'username',
              password: 'password',
            ),
          ).thenThrow(const ApiServiceException());
          when(
            () => mockYURouter.pushAndPopUntil(
              const LoginRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).thenAnswer((_) => Future.value());

          await startupViewModel.handleStartup();

          verify(() => mockSharedPrefsService.getUsername()).called(1);
          verify(() => mockSharedPrefsService.getPassword()).called(1);
          verify(
            () => mockApiService.login(
              username: 'username',
              password: 'password',
            ),
          ).called(1);
          verify(
            () => mockYURouter.pushAndPopUntil(
              const LoginRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).called(1);
        },
      );

      test(
        'should navigate to login route '
        'if the username or password is null.',
        () async {
          when(() => mockSharedPrefsService.getUsername()).thenReturn(null);
          when(() => mockSharedPrefsService.getPassword()).thenReturn(null);

          when(
            () => mockYURouter.pushAndPopUntil(
              const OnboardingRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).thenAnswer((_) => Future.value());

          await startupViewModel.handleStartup();

          verify(() => mockSharedPrefsService.getUsername()).called(1);
          verify(() => mockSharedPrefsService.getPassword()).called(1);
          verify(
            () => mockYURouter.pushAndPopUntil(
              const OnboardingRoute(),
              predicate: captureAny(named: 'predicate'),
            ),
          ).called(1);
        },
      );
    });
  });
}

class MockApiService extends Mock implements ApiService {}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}

class MockYURouter extends Mock implements YURouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo {}

class FakeActorDetails extends Fake implements ActorDetails {}

class MockActorDetailsNotifier extends Mock implements ActorDetailsNotifier {}
