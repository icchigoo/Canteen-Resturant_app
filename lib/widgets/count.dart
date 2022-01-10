// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:canteen_app/config/colors.dart';

import 'package:canteen_app/providers/review_cart_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  late String productName;
  late String productImage;
  late String productId;
  late int productPrice;
  // ignore: prefer_typing_uninitialized_variables
  var productUnit;

  Count(
      {Key? key,
      required this.productName,
      required this.productImage,
      required this.productId,
      required this.productPrice,
      required this.productUnit})
      : super(key: key);

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewChart")
        .doc(widget.productId)
        .get()
        .then((value) => {
              if (mounted)
                {
                  if (value.exists)
                    {
                      setState(() {
                        count = value.get("cartQuantity");
                        isTrue = value.get("isAdd");
                      })
                    }
                }
            });
  }

  @override
  Widget build(BuildContext context) {
    getAddAndQuantity();
    ReviewCartProvider reviewCarProvider = Provider.of(context);
    return Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white54,
          borderRadius: BorderRadius.circular(8),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                        reviewCarProvider
                            .reviewCartDataDelete(widget.productId);
                      } else if (count > 1) {
                        setState(() {
                          count--;
                        });
                        reviewCarProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productPrice,
                          cartQuantity: count,
                          //  productUnit: unitData == null?firstValue : unitData,
                        );
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      color: Color(0xffd0b84c),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      reviewCarProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                        // cartUnit: widget.productUnit
                      );
                    },
                    child: Icon(
                      Icons.add,
                      color: Color(0xffd0b84c),
                      size: 15,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCarProvider.addReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: count,
                        cartUnit: widget.productUnit
                        // isAdd: true,
                        );
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ));
  }
}
