// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/widgets/single_item.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.menu_rounded),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Item"),
          ),
          Container(
            height: 52,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                fillColor: Color(0xffc2c2c2),
                filled: true,
                hintText: "Search for foods in the menu",
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
        ],
      ),
    );
  }
}
