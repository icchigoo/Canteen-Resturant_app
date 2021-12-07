// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:flutter/material.dart';

class Count extends StatefulWidget {
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white54,
          borderRadius: BorderRadius.circular(8),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,

                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                      }
                      if (count > 1) {
                        setState(() {
                          count--;
                        });
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 15,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                  Text(
                    '$count',
                    style: TextStyle(
                      color: Color(0xffd0b84c),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Color(0xffd0b84c),
                      size: 15,
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                  },
                  child: Text(
                    "Add",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ));
  }
}
