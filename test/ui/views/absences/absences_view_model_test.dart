import 'package:alyamamah/core/models/absence.dart';
import 'package:alyamamah/core/router/yu_router.dart';
import 'package:alyamamah/core/services/api/api_service.dart';
import 'package:alyamamah/core/services/api/api_service_exception.dart';
import 'package:alyamamah/ui/views/absences/absences_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

void main() {
  group('absencesViewModelProvider |', () {
    test(
      'verify the provider type.',
      () {
        expect(
          absencesViewModelProvider,
          isA<ChangeNotifierProvider<AbsencesViewModel>>(),
        );
      },
    );

    test(
      'verify the provider works.',
      () {
        final container = ProviderContainer();
        final absencesViewModel = container.read(absencesViewModelProvider);

        expect(absencesViewModel, isA<AbsencesViewModel>());
      },
    );
  });

  group('AbsencesViewModel |', () {
    late MockApiService mockApiService;
    late MockYURouter mockYURouter;
    late AbsencesViewModel absencesViewModel;

    setUp(() {
      mockApiService = MockApiService();
      mockYURouter = MockYURouter();
      absencesViewModel = AbsencesViewModel(
        apiService: mockApiService,
        yuRouter: mockYURouter,
      );
    });

    group('getAbsences |', () {
      test(
        'should get absences list of method is successful.',
        () async {
          when(() => mockApiService.getAbsences())
              .thenAnswer((_) async => [FakeAbsence()]);

          await absencesViewModel.getAbsences();

          expect(absencesViewModel.absences, hasLength(1));
          expect(absencesViewModel.absences[0], isA<Absence>());
          expect(absencesViewModel.isBusy, false);

          verify(() => mockApiService.getAbsences()).called(1);
        },
      );

      test(
        'should not get absences list of method is not successful.',
        () async {
          when(() => mockApiService.getAbsences())
              .thenThrow(const ApiServiceException());

          await absencesViewModel.getAbsences();

          expect(absencesViewModel.absences, hasLength(0));
          expect(absencesViewModel.isBusy, false);

          verify(() => mockApiService.getAbsences()).called(1);
        },
      );
    });

    group('navigateToAbsenceDetails |', () {
      test(
        'should navigate to absence details.',
        () async {
          final absence = FakeAbsence();

          when(() => mockYURouter.push(AbsenceDetailsRoute(absence: absence)))
              .thenAnswer((_) => Future.value());

          await absencesViewModel.navigateToAbsenceDetails(absence);

          verify(
            () => mockYURouter.push(AbsenceDetailsRoute(absence: absence)),
          ).called(1);
        },
      );
    });
  });
}

class MockApiService extends Mock implements ApiService {}

class MockYURouter extends Mock implements YURouter {}

class FakeAbsence extends Fake implements Absence {}
