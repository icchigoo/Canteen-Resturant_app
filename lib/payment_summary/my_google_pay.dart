// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

// class MyGooglePay extends StatefulWidget {
//   final total;
//   MyGooglePay({this.total});
//   @override
//   _MyGooglePayState createState() => _MyGooglePayState();
// }

// class _MyGooglePayState extends State<MyGooglePay> {
// // In your Widget build() method

// // In your Stateless Widget class or State
//   void onGooglePayResult(paymentResult) {
//     print(paymentResult);
//     // Send the resulting Google Pay token to your server or PSP
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GooglePayButton(
//       paymentConfigurationAsset: 'gpay.json',
//       paymentItems: [
//         PaymentItem(
//           label: 'Total',
//           amount: '${widget.total}',
//           status: PaymentItemStatus.final_price,
//         )
//       ],
//       style: GooglePayButtonStyle.black,
//       type: GooglePayButtonType.pay,
//       onPaymentResult: onGooglePayResult,
//     );
//   }
// }

class MyGooglePay extends StatefulWidget {
  @override
  _MyGooglePayState createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
  var _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];

  void onGooglePayResult(paymentResult) {}

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'gpay.json',
      paymentItems: _paymentItems,
      style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}
