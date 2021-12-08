// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/models/review_cart_model.dart';
import 'package:canteen_app/providers/review_cart_provider.dart';
import 'package:canteen_app/widgets/single_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: use_key_in_widget_constructors
class ReviewCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "Rs 1100",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        // ignore: sized_box_for_whitespace
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
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleItem(
                      isBool: true,
                      prodcutImage: data.cartImage,
                      productName: data.cartName,
                      productprice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
