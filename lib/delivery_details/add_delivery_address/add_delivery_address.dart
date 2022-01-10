// ignore_for_file: prefer_const_constructors, constant_identifier_names, unused_local_variable, sized_box_for_whitespace, unnecessary_null_comparison, use_key_in_widget_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/delivery_details/google_map/google_map.dart';

import 'package:canteen_app/providers/check_out_provider.dart';
import 'package:canteen_app/widgets/costom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

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
    // var addressType = AddressTypes.Home==""
    CheckoutProvider checkoutProvider = Provider.of(context);
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
          child: checkoutProvider.isloadding == false
              ? MaterialButton(
                  onPressed: () {
                    checkoutProvider.validator(context, myType);
                  },
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
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First name",
              controller: checkoutProvider.firstName,
            ),
            CostomTextField(
              labText: "Last name",
              controller: checkoutProvider.lastName,
            ),
            CostomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CostomTextField(
              labText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
            ),
            CostomTextField(
              labText: "Society",
              controller: checkoutProvider.society,
            ),
            CostomTextField(
                labText: "Street", controller: checkoutProvider.street),
            CostomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CostomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CostomTextField(
              labText: "Aera",
              controller: checkoutProvider.aera,
            ),
            CostomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CostomGoogleMap(),
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
                    checkoutProvider.setLoaction == null
                        ? Text("Set Loaction")
                        : Text("Done!"),
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
