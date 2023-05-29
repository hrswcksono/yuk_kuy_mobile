import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yuk_kuy_mobile/app/modules/payment/controllers/payment_controller.dart';

import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class PaymentInformationView extends GetView {
  PaymentInformationView(this.urlMidtrans, {Key? key}) : super(key: key);
  final String? urlMidtrans;
  var paymentC = Get.put(PaymentController());

  @override
  Widget build(BuildContext context) {
    var controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith(urlMidtrans!)) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(urlMidtrans!));
    return Scaffold(
      body: SafeArea(child: WebViewWidget(controller: controller)),
    );
  }
}
