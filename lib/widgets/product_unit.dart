// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  late final VoidCallback onTap;
  late final String title;
  ProductUnit({required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.only(left: 2),
        height: 25,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white54,
          borderRadius: BorderRadius.circular(8),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: Row(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Expanded(
                child: Text(
              // ignore: unnecessary_string_interpolations
              '$title',
              style: TextStyle(fontSize: 13),
            )),
            Center(
              child: Icon(
                Icons.arrow_drop_down,
                size: 20,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
