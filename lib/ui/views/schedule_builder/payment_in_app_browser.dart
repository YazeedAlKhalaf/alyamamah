import 'package:alyamamah/core/constants.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:logging/logging.dart';

class PaymentInAppBrowser extends InAppBrowser {
  final _log = Logger('PaymentInAppBrowser');

  final String paymentAmount;
  final Future<void> Function() onPaymentSuccess;
  final Future<void> Function() onPaymentFailure;

  PaymentInAppBrowser({
    required this.paymentAmount,
    required this.onPaymentSuccess,
    required this.onPaymentFailure,
  });

  @override
  Future onBrowserCreated() async {
    _log.info('Browser Created!');
  }

  @override
  Future onLoadStart(url) async {
    _log.info('Started $url');
  }

  @override
  Future onLoadStop(url) async {
    _log.info('Stopped $url');

    switch (url.toString()) {
      case Constants.paymentUrl:
        await webViewController.evaluateJavascript(
          source: '''
const paymentInput = document.getElementById('myForm:paymentAmount');
paymentInput.value = '$paymentAmount';

const feesTypeInput = document.getElementById('myForm:feesTypeId');
feesTypeInput.value = 1;

paymentInput.focus();
            ''',
        );
        break;
      case 'https://edugate.yu.edu.sa/yu/ui/student/onlinePayment/index/validatePaymentIndex.faces':
        _log.info('checking if payment is successful');
        final isPaymentSuccess = await webViewController.evaluateJavascript(
          source: '''
const errMsgSpan = document.getElementById('myForm:errMsg');
const isPaymentSuccess = errMsgSpan.style.color == 'green';
isPaymentSuccess;
            ''',
        );
        _log.info('isPaymentSuccess: $isPaymentSuccess');

        _log.info('closing browser');
        await close();

        if (isPaymentSuccess == true) {
          _log.info('running success code');
          await onPaymentSuccess();
        } else {
          _log.info('running failure code');
          await onPaymentFailure();
        }
        break;
    }
  }

  @override
  void onLoadError(url, code, message) {
    _log.info("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    _log.info('Progress: $progress');
  }

  @override
  void onExit() {
    _log.info('Browser closed!');
  }

  @override
  Future<ServerTrustAuthResponse?>? onReceivedServerTrustAuthRequest(
    URLAuthenticationChallenge challenge,
  ) async {
    if (challenge.protectionSpace.host == 'edugate.yu.edu.sa') {
      return ServerTrustAuthResponse(
        action: ServerTrustAuthResponseAction.PROCEED,
      );
    } else {
      return super.onReceivedServerTrustAuthRequest(challenge);
    }
  }
}
