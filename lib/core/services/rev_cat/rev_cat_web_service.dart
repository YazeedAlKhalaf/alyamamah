import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevCatWebService extends RevCatService {
  @override
  Future<void> initPlatformState() async {
    return;
  }

  @override
  Future<void> logIn(String userId) async {
    return;
  }

  @override
  Future<void> logOut() async {
    return;
  }

  @override
  Future<CustomerInfo?> restore() async {
    return null;
  }

  @override
  Future<bool> canMakePayments() async {
    return false;
  }

  @override
  Future<Offerings> getOfferings() async {
    return const Offerings({});
  }

  @override
  Future<CustomerInfo> purchasePackage({required Package package}) async {
    return const CustomerInfo(
      EntitlementInfos({}, {}),
      {},
      [],
      [],
      [],
      'firstSeen',
      'originalAppUserId',
      {},
      'requestDate',
    );
  }
}
