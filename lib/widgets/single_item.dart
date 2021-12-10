// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:canteen_app/config/colors.dart';
import 'package:flutter/material.dart';

import 'count.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;
  String prodcutImage;
  String productName;
  int productprice;
  String productId;
  bool wishList = false;
  // int productQuantity;
  VoidCallback onDelete;

  SingleItem({
    required this.isBool,
    required this.prodcutImage,
    required this.productName,
    required this.productprice,
    required this.productId,
    required this.wishList,
    //required this.productQuantity,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
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
                    child: Image.network(prodcutImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          // ignore: prefer_const_constructors
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$productprice\$",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      isBool == false
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
                                        "chicken",
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
                          : Text("1 plate")
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 130,
                  color: scaffoldBackgroundColor,
                  padding: isBool == false
                      ? EdgeInsets.symmetric(horizontal: 30, vertical: 50)
                      : EdgeInsets.only(left: 5, right: 5),
                  // ignore: unrelated_type_equality_checks
                  child: isBool == false
                      ? Count(
                          productId: productId,
                          productImage: prodcutImage,
                          productName: productName,
                          productPrice: productprice,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                  onTap: onDelete,
                                  child: Icon(
                                    Icons.delete,
                                    size: 30,
                                    color: Colors.black54,
                                  )),
                              SizedBox(
                                height: 3,
                              ),
                              wishList == true
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
                                            Icon(
                                              Icons.remove,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              "1",
                                              style: TextStyle(
                                                color: primaryColor,
                                              ),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: primaryColor,
                                              size: 20,
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
        isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}
