import 'dart:io' show Platform;

import 'package:alyamamah/core/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logging/logging.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

final revCatServiceProvider = Provider((ref) {
  return RevCatService();
});

class RevCatService {
  static final Logger _log = Logger('RevCatService');

  Future<void> initPlatformState() async {
    await Purchases.setLogLevel(LogLevel.debug);

    late PurchasesConfiguration configuration;
    if (Platform.isAndroid) {
      configuration = PurchasesConfiguration(Constants.publicGoogleSdkKey);
    } else if (Platform.isIOS) {
      configuration = PurchasesConfiguration(Constants.publicIosSdkKey);
    }
    await Purchases.configure(configuration);
  }

  Future<void> logIn(String userId) async {
    await Purchases.logIn(userId);
  }

  Future<void> logOut() async {
    await Purchases.logOut();
  }

  Future<CustomerInfo> getCustomerInfo() async {
    return Purchases.getCustomerInfo();
  }

  Future<CustomerInfo?> restore() async {
    try {
      final restoredInfo = await Purchases.restorePurchases();

      return restoredInfo;
    } on PlatformException catch (e) {
      _log.severe(
        'restore() | PlatformException happened restoring purchasing.',
        e,
      );

      return null;
    }
  }

  Future<bool> canMakePayments() async {
    return Purchases.canMakePayments();
  }

  Future<Offerings> getOfferings() async {
    return Purchases.getOfferings();
  }

  Future<CustomerInfo> purchasePackage({required Package package}) async {
    final customerInfo = await Purchases.purchasePackage(package);
    return customerInfo;
  }
}
