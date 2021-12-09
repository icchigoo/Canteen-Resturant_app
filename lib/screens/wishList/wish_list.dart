// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/models/product_model.dart';

import 'package:canteen_app/providers/wish_list_provider.dart';
import 'package:canteen_app/widgets/single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class WishList extends StatefulWidget {
  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        wishListProvider.deleteWishtList(delete.productId);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("WishList Product"),
      content: Text("Are you devete on WishList Product?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  late WishListProvider wishListProvider;
  @override
  Widget build(BuildContext context) {
    wishListProvider = Provider.of(context);
    wishListProvider.getWishtListData();
    // ignore: unused_local_variable

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Wish List",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: ListView.builder(
        itemCount: wishListProvider.getWishList.length,
        itemBuilder: (context, index) {
          ProductModel data = wishListProvider.getWishList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                wishList: false,
                isBool: true,
                prodcutImage: data.productImage,
                productName: data.productName,
                productprice: data.productPrice,
                productId: data.productId,
                // productQuantity: data.productQuantity,
                onDelete: () {
                  showAlertDialog(context, data);
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
