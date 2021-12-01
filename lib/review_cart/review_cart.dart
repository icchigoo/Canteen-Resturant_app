// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/widgets/single_item.dart';
import 'package:flutter/material.dart';

class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "Rs 1100",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView(
        children: [
          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),
          SingleItem(
            isBool: true,
          ),

          // ignore: prefer_const_constructors
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
