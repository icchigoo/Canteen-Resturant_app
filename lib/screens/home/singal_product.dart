// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_if_null_operators, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/models/product_model.dart';
import 'package:canteen_app/widgets/count.dart';
import 'package:canteen_app/widgets/product_unit.dart';
import 'package:flutter/material.dart';

class SingalProduct extends StatefulWidget {
  final String productImage;
  final String productName;
  final int productprice;
  final String productId;

  final ProductModel productUnit;

  final VoidCallback onTap;

  const SingalProduct(
      {required this.productImage,
      required this.productName,
      required this.onTap,
      required this.productprice,
      required this.productId,
      required this.productUnit});

  @override
  State<SingalProduct> createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  var unitData;
  var firstValue;
  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });

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
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
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
                          widget.productName,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${widget.productprice}\$/${unitData == null ? firstValue : unitData}',
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
                              child: ProductUnit(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: widget.productUnit.productUnit
                                            .map<Widget>((data) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      unitData = data;
                                                    });
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    data,
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    },
                                  );
                                },
                                title: unitData == null ? firstValue : unitData,
                              ),
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            // Expanded(
                            //   child:
                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productprice,
                              productUnit:
                                  unitData == null ? firstValue : unitData,
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
