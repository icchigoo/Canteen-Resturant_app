// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, constant_identifier_names, use_key_in_widget_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/payment_summary/order_item.dart';
import 'package:flutter/material.dart';

class PaymentSummary extends StatefulWidget {
  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$300",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              "Pleace Order",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text(" First and Last Name"),
                  subtitle: Text(
                    "area, kathmandu/nepal, Baneshwor, street, 20, society 07, pincode 09777",
                  ),
                ),
                Divider(),
                ExpansionTile(
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ],
                  title: Text("Order Items 6"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$200",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$0",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "D iscount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title: Text("Home"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.home,
                    color: primaryColor,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: Text("Work"),
                  onChanged: (AddressTypes? value) {
                    setState(() {
                      myType = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.work,
                    color: primaryColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
