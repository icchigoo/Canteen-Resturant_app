// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:canteen_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData(
      {required String wishListId,
      required String wishListName,
      required String wishListImage,
      required int wishListPrice,
      required int wishListQuantity,
      var wishListUnit}) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishQuantity": wishListQuantity,
        "wishList": true,
        "wishListUnit": wishListUnit,
      },
    );
  }

  /// Get WishList Data ///////
  List<ProductModel> wishList = [];

  getWishtListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
            id: element.get("wishListId"),
            productImage: element.get("wishListImage"),
            productName: element.get("wishListName"),
            productPrice: element.get("wishListPrice"),
            productQuantity: element.get("wishListQuantity"),
            productUnit: element.get("wishListUnit")
            // productUnit: element.get("wish")
            );
        newList.add(productModel);
      },
    );
    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }

  ////////// Delete WishList /////
  deleteWishtList(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }
}
