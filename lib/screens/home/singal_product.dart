// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

// class SingalProduct extends StatelessWidget {
//   //const ({ Key? key }) : super(key: key);
//   final String productImage;
//   final String productName;
//   final Function onTap;
//   SingalProduct({required this.productImage,
//       required this.productName,
//       required this.onTap});

class SingalProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productprice;

  final VoidCallback onTap;

  SingalProduct({
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productprice,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 290,
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
                  flex: 2,
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
                              child: Container(
                                padding: EdgeInsets.only(left: 5),
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // ignore: prefer_const_literals_to_create_immutables
                                child: Row(
                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Expanded(
                                        child: Text(
                                      'piece',
                                      style: TextStyle(fontSize: 10),
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
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                height: 30,
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(),
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                // ignore: prefer_const_literals_to_create_immutables
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,

                                  // ignore: prefer_const_literals_to_create_immutables
                                  children: [
                                    Icon(
                                      Icons.remove,
                                      size: 15,
                                      color: Color(0xffd0b84c),
                                    ),
                                    Text(
                                      '1',
                                      style: TextStyle(
                                        color: Color(0xffd0b84c),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.add,
                                      color: Color(0xffd0b84c),
                                      size: 15,
                                    ),
                                  ],
                                ),
                              ),
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
