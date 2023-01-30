import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final mainViewModelProvider = ChangeNotifierProvider.autoDispose(
  (ref) => MainViewModel(),
);

class MainViewModel extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onDestinationSelected(int value) {
    assert(value >= 0 && value <= 1, 'Invalid destination index');

    _selectedIndex = value;
    notifyListeners();
  }
}
