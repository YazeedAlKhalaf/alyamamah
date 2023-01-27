import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/authentication_service.dart';
import 'package:alyamamah/ui/views/startup/startup_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('StartupViewModel |', () {
    late MockAuthenticationService mockAuthenticationService;
    late MockYURouter mockYURouter;
    late StartupViewModel startupViewModel;

    setUp(() {
      registerFallbackValue(FakePageRouteInfo());

      mockAuthenticationService = MockAuthenticationService();
      mockYURouter = MockYURouter();

      startupViewModel = StartupViewModel(
        authenticationService: mockAuthenticationService,
        yuRouter: mockYURouter,
      );
    });

    test(
      'verify pushAndPopUntil is called when handleStartup succeeds.',
      () async {
        when(
          () => mockYURouter.pushAndPopUntil(
            const LoginRoute(),
            predicate: captureAny(named: 'predicate'),
          ),
        ).thenAnswer((_) => Future.value());

        await startupViewModel.handleStartup();

        verify(
          () => mockYURouter.pushAndPopUntil(
            const LoginRoute(),
            predicate: captureAny(named: 'predicate'),
          ),
        ).called(1);
      },
    );
  });
}

class MockAuthenticationService extends Mock implements AuthenticationService {}

class MockYURouter extends Mock implements YURouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo {}
