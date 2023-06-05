import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:flutter/widgets.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

extension StoreProductExtension on StoreProduct {
  String localizedTitle(BuildContext context) {
    if (identifier == Constants.alyamamahGPTProductId) {
      return context.s.alyamamah_gpt_title;
    }

    return title;
  }

  String localizedDescription(BuildContext context) {
    if (identifier == Constants.alyamamahGPTProductId) {
      return context.s.alyamamah_gpt_description;
    }

    return title;
  }
}
