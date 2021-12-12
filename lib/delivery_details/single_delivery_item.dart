import 'package:canteen_app/config/colors.dart';
import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  SingleDeliveryItem(
      {required this.title,
      required this.addressType,
      required this.address,
      required this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                // ignore: prefer_const_constructors
                padding: EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    addressType,
                    // ignore: prefer_const_constructors
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: CircleAvatar(
            radius: 8,
            backgroundColor: primaryColor,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 5,
              ),
              Text(number),
            ],
          ),
        ),
        // ignore: prefer_const_constructors
        Divider(
          height: 35,
        ),
      ],
    );
  }
}
