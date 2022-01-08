// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/models/product_model.dart';
import 'package:canteen_app/widgets/single_item.dart';
import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  final List<ProductModel> search;
  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  Search({required this.search});
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = "";

  searchItem(String query) {
    List<ProductModel> searchFood = widget.search.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Search"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.sort),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Items"),
          ),
          Container(
            color: Colors.white,
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for items in the store",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Column(
            children: _searchItem.map((data) {
              return SingleItem(
                wishList: true,
                isBool: false,
                productId: data.id,
                productQuantity: data.productQuantity,
                productprice: data.productPrice,
                productName: data.productName,
                prodcutImage: data.productImage,
                onDelete: () {},
                productUnit: null,
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}
