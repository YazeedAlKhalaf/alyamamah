import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/extensions/package_type.dart';
import 'package:alyamamah/core/extensions/store_product.dart';
import 'package:alyamamah/core/services/rev_cat/rev_cat_service.dart';
import 'package:alyamamah/ui/widgets/yu_snack_bar.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

@RoutePage()
class PaywallView extends ConsumerStatefulWidget {
  final String title;
  final String description;
  final List<Package> packages;
  final CustomerInfo customerInfo;

  const PaywallView({
    super.key,
    required this.title,
    required this.description,
    required this.packages,
    required this.customerInfo,
  });

  @override
  ConsumerState<PaywallView> createState() => _PaywallViewState();
}

class _PaywallViewState extends ConsumerState<PaywallView> {
  bool isPurchasing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 5),
          child: isPurchasing
              ? const LinearProgressIndicator()
              : const SizedBox.shrink(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                '🤖',
                style: TextStyle(
                  fontSize: 150,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                widget.description,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Constants.spacing),
              Card(
                margin: const EdgeInsets.all(Constants.padding),
                child: Column(
                  children: [
                    const SizedBox(height: Constants.spacing),
                    Text(
                      context.s.current_packages,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: Constants.spacing),
                    ...widget.packages.map(
                      (Package package) {
                        final storeProduct = package.storeProduct;
                        final entitlements =
                            widget.customerInfo.entitlements.active;
                        final isActive = entitlements.values.any(
                          (EntitlementInfo entitlementInfo) {
                            return entitlementInfo.productIdentifier ==
                                storeProduct.identifier;
                          },
                        );

                        return ListTile(
                          leading: const CircleAvatar(
                            child: Icon(Icons.smart_toy_rounded),
                          ),
                          title: Text(
                            storeProduct.localizedTitle(context),
                          ),
                          subtitle: Text(
                            storeProduct.localizedDescription(context),
                          ),
                          trailing: Text(
                            isActive
                                ? context.s.active_with_emoji
                                : '${storeProduct.priceString}\n${package.packageType.mapToString(context)}',
                            textAlign: TextAlign.center,
                          ),
                          onTap: isActive || isPurchasing
                              ? null
                              : () async {
                                  setState(() {
                                    isPurchasing = true;
                                  });

                                  if (await ref
                                      .read(revCatServiceProvider)
                                      .canMakePayments()) {
                                    try {
                                      await ref
                                          .read(revCatServiceProvider)
                                          .purchasePackage(package: package);
                                    } on PlatformException catch (e) {
                                      final errorCode =
                                          PurchasesErrorHelper.getErrorCode(e);

                                      switch (errorCode) {
                                        case PurchasesErrorCode
                                              .paymentPendingError:
                                          if (context.mounted) {
                                            YUSnackBar.show(
                                              context,
                                              message:
                                                  context.s.purchase_pending,
                                            );
                                          }
                                          break;
                                        case PurchasesErrorCode
                                              .purchaseCancelledError:
                                          if (context.mounted) {
                                            YUSnackBar.show(
                                              context,
                                              message: context.s
                                                  .purchase_has_been_cancelled,
                                            );
                                          }
                                          break;
                                        case PurchasesErrorCode
                                              .purchaseInvalidError:
                                          if (context.mounted) {
                                            YUSnackBar.show(
                                              context,
                                              message:
                                                  context.s.purchase_invalid,
                                            );
                                          }
                                          break;
                                        case PurchasesErrorCode
                                              .purchaseNotAllowedError:
                                          if (context.mounted) {
                                            YUSnackBar.show(
                                              context,
                                              message: context
                                                  .s.purchase_not_allowed,
                                            );
                                          }
                                          break;
                                        default:
                                          if (context.mounted) {
                                            YUSnackBar.show(
                                              context,
                                              message: context
                                                  .s.unknown_service_error,
                                            );
                                          }
                                          break;
                                      }
                                    }

                                    if (context.mounted) {
                                      await context.popRoute();
                                    }
                                  }

                                  setState(() {
                                    isPurchasing = false;
                                  });
                                },
                        );
                      },
                    ),
                    const SizedBox(height: Constants.spacing),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
