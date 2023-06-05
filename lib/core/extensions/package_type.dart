import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/widgets.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

extension PackageTypeExtension on PackageType {
  String mapToString(BuildContext context) {
    switch (this) {
      case PackageType.lifetime:
        return context.s.lifetime;
      case PackageType.annual:
        return context.s.annual;
      case PackageType.sixMonth:
        return context.s.six_month;
      case PackageType.threeMonth:
        return context.s.three_month;
      case PackageType.twoMonth:
        return context.s.two_month;
      case PackageType.monthly:
        return context.s.monthly;
      case PackageType.weekly:
        return context.s.weekly;
      default:
        return context.s.unknown;
    }
  }
}
