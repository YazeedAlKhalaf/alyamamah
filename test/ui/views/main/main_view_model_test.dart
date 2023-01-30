import 'package:alyamamah/ui/views/main/main_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mainViewModelProvider |', () {
    test(
      'should verify the provider type.',
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

    setUp(() {
      mainViewModel = MainViewModel();
    });

    group('onDestinationSelected |', () {
      test(
        'should change selectedIndex when called.',
        () {
          expect(mainViewModel.selectedIndex, 0);

          mainViewModel.onDestinationSelected(1);

          expect(mainViewModel.selectedIndex, 1);
        },
      );

      test(
        'should get asserrtion error when value is less than 0.',
        () {
          expect(mainViewModel.selectedIndex, 0);

          expect(
            () => mainViewModel.onDestinationSelected(-1),
            throwsA(isA<AssertionError>()),
          );
        },
      );

      test(
        'should get asserrtion error when value is more than 1.',
        () {
          expect(mainViewModel.selectedIndex, 0);

          expect(
            () => mainViewModel.onDestinationSelected(2),
            throwsA(isA<AssertionError>()),
          );
        },
      );
    });
  });
}
