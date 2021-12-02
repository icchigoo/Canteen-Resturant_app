import 'package:canteen_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  // ignore: non_constant_identifier_names
  List<ProductModel> TodayProductList = [];
  late ProductModel productModel;

  fatchTodayProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("TodayProduct").get();
    value.docs.forEach(
      (element) {
        productModel = ProductModel(
          productImage: element.get("productImage"),
          productName: element.get("productName"),
          productPrice: element.get("productPrice"),
          productId: '',
          productUnit: [],
        );
        newList.add(productModel);
      },
    );
    TodayProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getTodayproductDataList {
    return TodayProductList;
  }
}
