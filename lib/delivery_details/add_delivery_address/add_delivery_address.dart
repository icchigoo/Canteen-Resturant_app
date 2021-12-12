// ignore_for_file: prefer_const_constructors, constant_identifier_names

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/widgets/costom_text_field.dart';
import 'package:flutter/material.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  State<AddDeliverAddress> createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    // CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: MaterialButton(
          onPressed: () {},
          child: Text(
            "Add Address",
            style: TextStyle(
              color: textColor,
            ),
          ),
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First name",
            ),
            CostomTextField(
              labText: "Last name",
            ),
            CostomTextField(
              labText: "Mobile No",
            ),
            CostomTextField(
              labText: "Alternate Mobile No",
            ),
            CostomTextField(
              labText: "Scoiety",
            ),
            CostomTextField(
              labText: "Street",
            ),
            CostomTextField(
              labText: "Landmark",
            ),
            CostomTextField(
              labText: "City",
            ),
            CostomTextField(
              labText: "Aera",
            ),
            CostomTextField(
              labText: "Pincode",
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => AddDeliverAddress(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text("Set Location"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
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
              value: AddressTypes.Work,
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
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
