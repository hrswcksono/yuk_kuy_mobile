import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PaymentVerificationView extends GetView {
  const PaymentVerificationView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentVerificationView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentVerificationView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
