// // ignore_for_file: prefer_const_constructors

// import 'dart:math';

// import 'package:canteen_app/config/colors.dart';
// import 'package:canteen_app/payment_summary/order_item.dart';
// import 'package:flutter/material.dart';

// class PaymentSummary extends StatefulWidget {
//   @override
//   State<PaymentSummary> createState() => _PaymentSummaryState();
// }

// enum AddressTypes {
//   cash,
//   onlinePayment,
// }

// class _PaymentSummaryState extends State<PaymentSummary> {
//   var myType = AddressTypes.cash;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Payment Summary",
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//       bottomNavigationBar: ListTile(
//         // ignore: prefer_const_constructors
//         title: Text("Total Amount"),
//         subtitle: Text(
//           "\$300",
//           style: TextStyle(
//             color: Colors.green[900],
//             fontWeight: FontWeight.bold,
//             fontSize: 17,
//           ),
//         ),

//         trailing: Container(
//           width: 160,
//           child: MaterialButton(
//             onPressed: () {},
//             child: Text(
//               "Order",
//               style: TextStyle(color: textColor),
//             ),
//             color: primaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(30),
//             ),
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.only(top: 10),
//         child: ListView.builder(
//           itemCount: 1,
//           itemBuilder: (context, index) {
//             // ignore: dead_code
//             return Column(children: [
//               ListTile(
//                 title: Text("First and last Name"),
//                 subtitle: Text(""),
//               ),
//               Divider(),
//               ExpansionTile(
//                 children: [
//                   OrderItem(),
//                   OrderItem(),
//                   OrderItem(),
//                   OrderItem(),
//                   OrderItem(),
//                   OrderItem(),
//                 ],
//                 title: Text(" Order Item 10"),
//               ),
//               Divider(),
//               ListTile(
//                 minVerticalPadding: 5,
//                 leading: Text(
//                   "Sub Total",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 trailing: Text(
//                   "\$200",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 minVerticalPadding: 5,
//                 leading: Text(
//                   "Service Charge",
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 trailing: Text(
//                   "\$20",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               ListTile(
//                 minVerticalPadding: 5,
//                 leading: Text(
//                   "Discount",
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                   ),
//                 ),
//                 trailing: Text(
//                   "\$30",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               Divider(),
//               ListTile(
//                 leading: Text("Payment Options"),
//               ),
//               RadioListTile(
//                 value: AddressTypes.cash,
//                 groupValue: myType,
//                 title: Text("Home"),
//                 onChanged: (AddressTypes value) {
//                   setState(() {
//                     myType = value;
//                   });
//                 },
//                 secondary: Icon(
//                   Icons.work,
//                   color: primaryColor,
//                 ),
//               ),
//               RadioListTile(
//                 value: AddressTypes.onlinePayment,
//                 groupValue: myType,
//                 title: Text("OnlinePayment"),
//                 onChanged: (AddressTypes value) {
//                   setState(() {
//                     myType = value;
//                   });
//                 },
//                 secondary: Icon(
//                   Icons.devices_other,
//                   color: primaryColor,
//                 ),
//               )
//             ]);
//           },
//         ),
//       ),
//     );
//   }
// }
