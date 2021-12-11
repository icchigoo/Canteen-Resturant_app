// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/providers/product_provider.dart';
import 'package:canteen_app/providers/wish_list_provider.dart';
import 'package:canteen_app/review_cart/review_cart.dart';
import 'package:canteen_app/screens/wishList/wish_list.dart';
import 'package:canteen_app/widgets/count.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:provider/provider.dart';

enum SinginCharacter { fill, outline }

// ignore: use_key_in_widget_constructors
class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrice;
  final String productQuantity;
  final String productId;
  // ignore: use_key_in_widget_constructors, prefer_const_constructors_in_immutables
  ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,
    required this.productQuantity,
  });

  // get productQuantity => null;

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
    required VoidCallback onTap,
  }) {
    return Expanded(
      // child: GestureDetector(
      //onTap: onTap,
      child: GestureDetector(
        onTap: onTap,
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
      ),
      // ),
    );
  }

  bool wishListBool = false;

  getWishListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        wishListBool = value.get("wishList");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    getWishListBool();
    return Scaffold(
        bottomNavigationBar: Row(
          children: [
            bonntonNavigatorBar(
                backgroundColor: textColor,
                color: Colors.white70,
                iconColor: Colors.orange,
                title: "add TO whishlist",
                iconData: wishListBool == false
                    ? Icons.favorite_outline
                    : Icons.favorite,
                onTap: () {
                  setState(() {
                    wishListBool = !wishListBool;
                  });
                  if (wishListBool == true) {
                    wishListProvider.addWishListData(
                        wishListId: widget.productId,
                        wishListImage: widget.productImage,
                        wishListName: widget.productName,
                        wishListPrice: widget.productPrice,
                        wishListQuantity: 2);
                  } else {
                    wishListProvider.deleteWishtList(widget.productId);
                  }
                }),
            bonntonNavigatorBar(
                backgroundColor: primaryColor,
                color: Colors.white70,
                iconColor: Colors.yellow,
                title: "Go To Cart",
                iconData: Icons.shop_outlined,
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                }),
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
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit: "",
                            ),
                            // Container(
                            //   padding: EdgeInsets.symmetric(
                            //     horizontal: 30,
                            //     vertical: 10,
                            //   ),
                            //   decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.grey),
                            //     borderRadius: BorderRadius.circular(30),
                            //   ),
                            //   child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       Icon(
                            //         Icons.add,
                            //         size: 17,
                            //         color: primaryColor,
                            //       ),
                            //       Text(
                            //         'ADD',
                            //         style: TextStyle(color: Colors.red),
                            //       ),
                            //     ],
                            //   ),
                            // )
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
