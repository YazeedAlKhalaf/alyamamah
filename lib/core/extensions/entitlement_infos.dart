import 'package:alyamamah/core/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

extension EntitlementInfosExtension on EntitlementInfos {
  bool isAlyamamahGPTActive() {
    return active.values.any(
      (entitlementInfo) =>
          entitlementInfo.productIdentifier == Constants.alyamamahGPTProductId,
    );
  }
}
