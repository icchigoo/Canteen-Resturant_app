// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/delivery_details/add_delivery_address/add_delivery_address.dart';

import 'package:canteen_app/delivery_details/single_delivery_item.dart';

import 'package:flutter/material.dart';

class DeliveryDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliverAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,

        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: Text("Add new Address"),
          onPressed: () {},
          color: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.asset(
              "assets/location.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          Column(
            children: [
              SingleDeliveryItem(
                address:
                    "area, kathmandu/nepal, Baneshwor, street, 20, society 07, pincode 09777",
                title: " Ajay Chhetri",
                number: "100",
                addressType: "Home",
              )
            ],
          )
        ],
      ),
    );
  }
}
