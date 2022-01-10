// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:canteen_app/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;

  List<ProductModel> search = [];
  productModels(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productPrice: element.get("productPrice"),
      productName: element.get("productName"),
      productImage: element.get("productImage"),
      id: element.get("id"),
      productUnit: element.get("productUnit"),
      productQuantity: 0,
    );

    search.add(productModel);
  }

  ////////////////////////today product//////////////////
  // ignore: non_constant_identifier_names
  List<ProductModel> TodayProductList = [];

  fatchTodayProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("todayProduct").get();
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    TodayProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getTodayproductDataList {
    return TodayProductList;
  }

/////////////////////////////Drink product//////////////////////////
  List<ProductModel> drinkProductList = [];

  fatchdrinkProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("drinkProduct").get();
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    drinkProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getdrinkproductDataList {
    return drinkProductList;
  }

////////////////////////////////Famous product//////////////////////
  List<ProductModel> famousProductList = [];

  fatchfamousProductData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("famousProduct").get();
    value.docs.forEach(
      (element) {
        productModels(element);

        newList.add(productModel);
      },
    );
    famousProductList = newList;
    notifyListeners();
  }

  List<ProductModel> get getfamousproductDataList {
    return famousProductList;
  }

  //////////////////search return////////////////////////

  List<ProductModel> get getAllProductSearch {
    return search;
  }
}
