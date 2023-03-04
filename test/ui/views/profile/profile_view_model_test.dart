import 'package:alyamamah/core/providers/actor_details/actor_details_notifier.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/shared_prefs/shared_prefs_service.dart';
import 'package:alyamamah/ui/views/profile/profile_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('profileViewModelProvider |', () {
    test(
      'verify the type of the provider.',
      () {
        expect(
          profileViewModelProvider,
          isA<ChangeNotifierProvider<ProfileViewModel>>(),
        );
      },
    );

    test(
      'should return ProfileViewModel instance.',
      () {
        final container = ProviderContainer(
          overrides: [
            yuRouterProvider.overrideWith((_) => MockYURouter()),
            sharedPrefsServiceProvider
                .overrideWith((_) => MockSharedPrefsService()),
            apiServiceProvider.overrideWith((_) => MockApiService()),
          ],
        );

        expect(
          container.read(profileViewModelProvider),
          isA<ProfileViewModel>(),
        );
      },
    );
  });

  group('ProfileViewModel |', () {
    late MockYURouter mockYURouter;
    late MockSharedPrefsService mockSharedPrefsService;
    late MockActorDetailsNotifier mockActorDetailsNotifier;
    late MockApiService mockApiService;
    late ProfileViewModel profileViewModel;

    setUp(() {
      mockYURouter = MockYURouter();
      mockSharedPrefsService = MockSharedPrefsService();
      mockActorDetailsNotifier = MockActorDetailsNotifier();
      mockApiService = MockApiService();
      profileViewModel = ProfileViewModel(
        yuRouter: mockYURouter,
        sharedPrefsService: mockSharedPrefsService,
        actorDetailsNotifier: mockActorDetailsNotifier,
        apiService: mockApiService,
      );
    });

    group('navigateToStudentInfo |', () {
      test(
        'should call push with student info route.',
        () async {
          when(() => mockYURouter.push(const StudentInfoRoute()))
              .thenAnswer((_) => Future.value());

          await profileViewModel.navigateToStudentInfo();

          verify(() => mockYURouter.push(const StudentInfoRoute()));
        },
      );
    });

    group('logout |', () {
      test(
        'should verify calls when logout is called.',
        () async {
          when(() => mockApiService.logout()).thenAnswer((_) => Future.value());
          when(() => mockSharedPrefsService.deleteUsernameAndPassword())
              .thenAnswer((_) => Future.value());
          when(
            () => mockYURouter.pushAndPopUntil(
              const LoginRoute(),
              predicate: any(named: 'predicate'),
            ),
          ).thenAnswer((_) => Future.value());

          await profileViewModel.logout();

          expect(profileViewModel.isBusy, false);

          verify(() => mockApiService.logout()).called(1);
          verify(() => mockSharedPrefsService.deleteUsernameAndPassword())
              .called(1);
          verify(
            () => mockYURouter.pushAndPopUntil(
              const LoginRoute(),
              predicate: any(named: 'predicate'),
            ),
          ).called(1);
        },
      );
    });
  });
}

class MockYURouter extends Mock implements YURouter {}

class MockSharedPrefsService extends Mock implements SharedPrefsService {}

class MockActorDetailsNotifier extends Mock implements ActorDetailsNotifier {}

class MockApiService extends Mock implements ApiService {}
