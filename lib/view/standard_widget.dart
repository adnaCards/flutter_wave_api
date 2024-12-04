import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../core/TransactionCallBack.dart';
import '../models/responses/charge_response.dart';
import 'flutterwave_in_app_browser.dart';

class StandardPaymentWidget extends StatefulWidget {

  final String webUrl;

  StandardPaymentWidget({ required this.webUrl });

  @override
  _StandardPaymentWidgetAppState createState() => new _StandardPaymentWidgetAppState();
}

class _StandardPaymentWidgetAppState extends State<StandardPaymentWidget> implements TransactionCallBack {

  var options = InAppBrowserClassSettings(
      browserSettings: InAppBrowserSettings(
          toolbarTopTintColor: Colors.white,
          toolbarBottomTintColor: Colors.transparent,
          hideToolbarTop: false,
          toolbarTopTranslucent: false,
          toolbarTopBackgroundColor: Colors.white
      )

  );
  @override
  void initState() {
    super.initState();
    final browser = FlutterwaveInAppBrowser(callBack: this);
    browser.openUrlRequest(urlRequest: URLRequest(url: WebUri(widget.webUrl)), settings: options);
  }

  @override
  onTransactionComplete(ChargeResponse? chargeResponse) {
    Navigator.pop(context, chargeResponse);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      backgroundColor: Colors.white,
    );
  }

}