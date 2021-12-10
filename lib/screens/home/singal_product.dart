// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/widgets/count.dart';
import 'package:flutter/material.dart';

class SingalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productprice;
  final String productId;

  final VoidCallback onTap;

  SingalProduct({
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productprice,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 225,
            width: 170,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 1,
                      vertical: 1,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        Text(
                          productName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$productprice\$small size',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: InkWell(
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
                                        'Size',
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
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            // Expanded(
                            //   child:
                            Count(
                              productId: productId,
                              productImage: productImage,
                              productName: productName,
                              productPrice: productprice,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
