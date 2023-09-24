import 'package:alyamamah/core/models/day.dart';

extension IntX on int {
  // This is a method that converts an int to a Day enum
  // It will return Day.sun if the int is not between 1 and 7
  Day mapToDay() {
    switch (this) {
      case 1:
        return Day.mon;
      case 2:
        return Day.tue;
      case 3:
        return Day.wed;
      case 4:
        return Day.thu;
      case 5:
        return Day.fri;
      case 6:
        return Day.sat;
      case 7:
        return Day.sun;
      default:
        return Day.sun;
    }
  }
}
