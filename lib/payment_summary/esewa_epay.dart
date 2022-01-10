// ignore_for_file: prefer_collection_literals, unused_field, prefer_final_fields, use_key_in_widget_constructors, deprecated_member_use, prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:webview_flutter/webview_flutter.dart';

class EsewaEpay extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<EsewaEpay> {
  Completer<WebViewController> _controller = Completer<WebViewController>();

  late WebViewController _webViewController;

  String testUrl = "https://pub.dev/packages/webview_flutter";

  _loadHTMLfromAsset() async {
    String file = await rootBundle.loadString("assets/epay_request.html");
    _webViewController.loadUrl(Uri.dataFromString(file,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }

  // ePay deatils
  double tAmt = 1000;
  double amt = 800;
  double txAmt = 100;
  double psc = 50;
  double pdc = 50;
  String scd = "EPAYTEST";
  String su =
      "https://i.pinimg.com/originals/64/cc/14/64cc14f738d96ae13c5441b8fcd307af.jpg";
  String fu =
      "https://i.pinimg.com/originals/64/cc/14/64cc14f738d96ae13c5441b8fcd307af.jpg";

  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     setState(() {
      //       String pid = UniqueKey().toString();
      //       _webViewController.evaluateJavascript(
      //           'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
      //     });
      //   },
      //   child: Icon(Icons.add),
      // ),
      appBar: AppBar(
        leading: SizedBox.shrink(),
      ),
      body: WebView(
        initialUrl: "about:blank",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
            name: "message",
            onMessageReceived: (message) {},
          ),
        ]),
        onPageFinished: (data) {
          setState(() {
            String pid = UniqueKey().toString();
            _webViewController.evaluateJavascript(
                'requestPayment(tAmt = $tAmt, amt = $amt, txAmt = $txAmt, psc = $psc, pdc = $pdc, scd = "$scd", pid = "$pid", su = "$su", fu = "$fu")');
          });
        },
        onWebViewCreated: (webViewController) {
          // _controller.complete(webViewController);
          _webViewController = webViewController;
          _loadHTMLfromAsset();
        },
      ),
    );
  }
}
