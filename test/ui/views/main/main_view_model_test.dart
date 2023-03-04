import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mainViewModelProvider |', () {
    test(
      'verify the provider type.',
      () {
        expect(
          mainViewModelProvider,
          isA<AutoDisposeChangeNotifierProvider<MainViewModel>>(),
        );
      },
    );

    test(
      'should return MainViewModel instance.',
      () {
        final container = ProviderContainer();

        expect(
          container.read(mainViewModelProvider),
          isA<MainViewModel>(),
        );
      },
    );
  });

  group('MainViewModel |', () {
    late MainViewModel mainViewModel;
    late int notifyListenersCount = 0;

    setUp(() {
      mainViewModel = MainViewModel();

      notifyListenersCount = 0;
      mainViewModel.addListener(() {
        notifyListenersCount++;
      });
    });

    group('onDestinationSelected |', () {
      test(
        'should set selected index to 0.',
        () {
          expect(mainViewModel.selectedIndex, 0);

          mainViewModel.onDestinationSelected(0);

          expect(mainViewModel.selectedIndex, 0);
          expect(notifyListenersCount, 1);
        },
      );

      test(
        'should set selected index to 1.',
        () {
          expect(mainViewModel.selectedIndex, 0);

          mainViewModel.onDestinationSelected(1);

          expect(mainViewModel.selectedIndex, 1);
          expect(notifyListenersCount, 1);
        },
      );

      test(
        'should set selected index to 2.',
        () {
          expect(mainViewModel.selectedIndex, 0);

          mainViewModel.onDestinationSelected(2);

          expect(mainViewModel.selectedIndex, 2);
          expect(notifyListenersCount, 1);
        },
      );

      test(
        'should throw exception when index is less than 0.',
        () {
          expect(
            () => mainViewModel.onDestinationSelected(-1),
            throwsA(isA<AssertionError>().having(
              (e) => e.message,
              'assertion error message',
              'Invalid destination index',
            )),
          );
        },
      );

      test(
        'should throw exception when index is more than 2.',
        () {
          expect(
            () => mainViewModel.onDestinationSelected(3),
            throwsA(isA<AssertionError>().having(
              (e) => e.message,
              'assertion error message',
              'Invalid destination index',
            )),
          );
        },
      );
    });
  });
}
