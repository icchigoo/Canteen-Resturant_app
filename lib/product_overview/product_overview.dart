// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

enum SinginCharacter { fill, outline }

// ignore: use_key_in_widget_constructors
class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ProductOverview(
      {required this.productImage,
      required this.productName,
      required this.productPrice});

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  // ignore: prefer_final_fields
  SinginCharacter _character = SinginCharacter.fill;

  Widget bonntonNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color color,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
      // child: GestureDetector(
      //onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(20),
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: 20,
              color: iconColor,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(color: color),
            ),
          ],
        ),
      ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            bonntonNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "add TO whishlist",
              iconData: Icons.favorite_outline,
            ),
            bonntonNavigatorBar(
              backgroundColor: textColor,
              color: Colors.white70,
              iconColor: Colors.grey,
              title: "add TO whishlist",
              iconData: Icons.favorite_outline,
            ),
          ],
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(color: textColor),
          title: Text(
            "Product Overview",
            style: TextStyle(color: textColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              // ignore: sized_box_for_whitespace
              child: Container(
                width: double.infinity,
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("Rs 50"),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.all(40),
                      child: Image.network(
                        widget.productImage,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      child: Text(
                        'Available options',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 3,
                                  backgroundColor: Colors.green[700],
                                ),
                                Radio(
                                  value: SinginCharacter.fill,
                                  groupValue: _character,
                                  activeColor: Colors.green[700],
                                  onChanged: (value) {
                                    setState(() {
                                      value = _character;
                                    });
                                  },
                                ),
                              ],
                            ),
                            Text("RS${widget.productPrice}"),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 10,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add,
                                    size: 17,
                                    color: primaryColor,
                                  ),
                                  Text(
                                    'ADD',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            )
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      'About this product',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Coded by AJAY CHHETRI',
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
