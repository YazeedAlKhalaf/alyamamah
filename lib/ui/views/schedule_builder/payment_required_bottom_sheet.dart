import 'package:alyamamah/core/constants.dart';
import 'package:alyamamah/core/extensions/build_context.dart';
import 'package:alyamamah/core/providers/cookie_jar/cookie_jar_provider.dart';
import 'package:alyamamah/ui/views/schedule_builder/payment_in_app_browser.dart';
import 'package:alyamamah/ui/widgets/yu_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart' as intl;

class PaymentRequiredBottomSheet extends ConsumerWidget {
  final String paymentRequiredMessage;
  final Future<void> Function() onPaymentSuccess;
  final Future<void> Function() onPaymentFailure;

  const PaymentRequiredBottomSheet({
    super.key,
    required this.paymentRequiredMessage,
    required this.onPaymentSuccess,
    required this.onPaymentFailure,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final amountRegex = RegExp(r'\((.*?)\)');
    final matches = amountRegex.allMatches(paymentRequiredMessage).toList();
    final previousCredit = matches[0].group(1).toString();
    final semesterFees = matches[1].group(1).toString();
    final totalBalance = matches[2].group(1).toString();

    return YUBottomSheet(
      title: context.s.payment_required,
      description: context.s.you_have_to_pay_before_saving_this_schedule,
      children: [
        Padding(
          padding: const EdgeInsets.all(Constants.padding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: Constants.spacing),
              SelectableText(
                context.s.previous_credit_x(
                  intl.NumberFormat.currency(symbol: 'SAR ').format(
                    double.parse(previousCredit),
                  ),
                ),
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: Constants.padding),
              SelectableText(
                context.s.semester_fees_x(
                  intl.NumberFormat.currency(symbol: 'SAR ').format(
                    double.parse(semesterFees),
                  ),
                ),
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: Constants.padding),
              SelectableText(
                context.s.total_x(
                  intl.NumberFormat.currency(symbol: 'SAR ').format(
                    double.parse(totalBalance),
                  ),
                ),
                style: context.textTheme.titleMedium,
              ),
              const SizedBox(height: Constants.padding),
              FilledButton(
                onPressed: () async {
                  final loginCookies = await ref
                      .read(cookieJarProvider)
                      .loadForRequest(Uri.parse(Constants.loginUrl));
                  final jSessionIdCookie = loginCookies.firstWhere(
                    (cookie) => cookie.name == 'JSESSIONID',
                  );

                  final cookieManager = CookieManager.instance();
                  await cookieManager.setCookie(
                    url: Uri.parse(
                      'https://edugate.yu.edu.sa',
                    ),
                    name: 'JSESSIONID',
                    value: jSessionIdCookie.value,
                    isHttpOnly: true,
                    isSecure: false,
                  );

                  final browser = PaymentInAppBrowser(
                    paymentAmount: totalBalance,
                    onPaymentSuccess: onPaymentSuccess,
                    onPaymentFailure: onPaymentFailure,
                  );
                  if (context.mounted) {
                    await browser.openUrlRequest(
                      urlRequest: URLRequest(
                        url: Uri.parse(Constants.paymentUrl),
                      ),
                      options: InAppBrowserClassOptions(
                        crossPlatform: InAppBrowserOptions(
                          toolbarTopBackgroundColor:
                              context.colorScheme.background,
                        ),
                        ios: IOSInAppBrowserOptions(
                          presentationStyle:
                              IOSUIModalPresentationStyle.FULL_SCREEN,
                          toolbarBottomBackgroundColor:
                              context.colorScheme.background,
                          toolbarTopTintColor: context.colorScheme.primary,
                          toolbarBottomTintColor: context.colorScheme.primary,
                        ),
                        android: AndroidInAppBrowserOptions(
                          closeOnCannotGoBack: true,
                          shouldCloseOnBackButtonPressed: false,
                        ),
                        inAppWebViewGroupOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            javaScriptEnabled: true,
                          ),
                          ios: IOSInAppWebViewOptions(),
                          android: AndroidInAppWebViewOptions(),
                        ),
                      ),
                    );
                  }
                },
                child: Text(context.s.open_payment_link),
              ),
              const SizedBox(height: Constants.spacing / 2),
              Text(
                context.s
                    .by_tapping_the_button_above_youll_pay_youre_fees_securely_on_the_universitys_site,
                style: context.textTheme.labelSmall?.copyWith(
                  color: context.colorScheme.outline,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: Constants.spacing),
              const Row(
                children: [],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
