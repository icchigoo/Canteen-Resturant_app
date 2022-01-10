// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace, unnecessary_new

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/providers/review_cart_provider.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import 'count.dart';

class SingleItem extends StatefulWidget {
  bool isBool = false;
  String prodcutImage;
  String productName;
  int productprice;
  String productId;
  bool wishList = false;
  int productQuantity;
  VoidCallback onDelete;
  // ignore: prefer_typing_uninitialized_variables
  var productUnit;

  SingleItem({
    required this.isBool,
    required this.prodcutImage,
    required this.productName,
    required this.productprice,
    required this.productId,
    required this.wishList,
    required this.productQuantity,
    required this.onDelete,
    required this.productUnit,
  });

  @override
  State<SingleItem> createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late int count;
  getCount() {
    setState(() {
      count = widget.productQuantity;
    });
  }

  // @override
  // void initState() {
  //   getCount();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    getCount();
    reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(widget.prodcutImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: widget.isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${widget.productprice}\$",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      widget.isBool == false
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          ListTile(
                                            title: new Text('Small'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: new Text('Medium'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                          ListTile(
                                            title: new Text('Large'),
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "",
                                        style: TextStyle(
                                          color: textColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Text(widget.productUnit)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 130,
                  color: Colors.white,
                  padding: widget.isBool == false
                      ? EdgeInsets.symmetric(horizontal: 30, vertical: 50)
                      : EdgeInsets.only(left: 5, right: 5),
                  // ignore: unrelated_type_equality_checks
                  child: widget.isBool == false
                      ? Count(
                          productId: widget.productId,
                          productImage: widget.prodcutImage,
                          productName: widget.productName,
                          productPrice: widget.productprice,
                          productUnit: null,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: widget.onDelete,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black54,
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              widget.wishList == false
                                  ? Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (count == 1) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "You have rach minium limit");
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                          cartImage: widget
                                                              .prodcutImage,
                                                          cartId:
                                                              widget.productId,
                                                          cartName: widget
                                                              .productName,
                                                          cartPrice: widget
                                                              .productprice,
                                                          cartQuantity: count);
                                                }
                                              },
                                              child: Icon(
                                                Icons.remove,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            ),
                                            Text(
                                              "$count",
                                              style: TextStyle(
                                                color: primaryColor,
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                if (count < 10) {
                                                  setState(() {
                                                    count++;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                          cartImage: widget
                                                              .prodcutImage,
                                                          cartId:
                                                              widget.productId,
                                                          cartName: widget
                                                              .productName,
                                                          cartPrice: widget
                                                              .productprice,
                                                          cartQuantity: count);
                                                }
                                              },
                                              child: Icon(
                                                Icons.add,
                                                color: primaryColor,
                                                size: 20,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        widget.isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.white,
              )
      ],
    );
  }
}
