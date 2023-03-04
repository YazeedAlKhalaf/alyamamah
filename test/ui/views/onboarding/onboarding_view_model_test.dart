import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/ui/views/onboarding/onboarding_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('onboardingViewModelProvider |', () {
    test(
      'verify the provider type.',
      () {
        expect(
          onboardingViewModelProvider,
          isA<ChangeNotifierProvider<OnboardingViewModel>>(),
        );
      },
    );

    test(
      'verify the provider returns.',
      () {
        final container = ProviderContainer();

        expect(
          container.read(onboardingViewModelProvider),
          isA<OnboardingViewModel>(),
        );
      },
    );
  });

  group('OnboardingViewModel |', () {
    late MockYURouter mockYURouter;
    late OnboardingViewModel onboardingViewModel;

    setUp(() {
      mockYURouter = MockYURouter();
      onboardingViewModel = OnboardingViewModel(
        yuRouter: mockYURouter,
      );
    });

    group('navigateToLoginView |', () {
      test(
        'should push login route.',
        () async {
          when(() => mockYURouter.push(const LoginRoute()))
              .thenAnswer((_) => Future.value());

          await onboardingViewModel.navigateToLoginView();

          verify(() => mockYURouter.push(const LoginRoute())).called(1);
        },
      );
    });
  });
}

class MockYURouter extends Mock implements YURouter {}
