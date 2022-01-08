// ignore_for_file: prefer_const_constructors, prefer_collection_literals, deprecated_member_use, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_element, unnecessary_new, prefer_final_fields

import 'package:canteen_app/admin%20panel/providers/app_states.dart';
import 'package:canteen_app/admin%20panel/screens/add_product.dart';
import 'package:canteen_app/admin%20panel/screens/add_products.dart';
import 'package:canteen_app/admin%20panel/screens/add_productss.dart';
import 'package:canteen_app/admin%20panel/widgets/small_card.dart';
import 'package:flutter/material.dart';
// import 'package:charts_flutter/flutter.dart' as charts;

import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset(1.0, 1.0), blurRadius: 4)
            ]),
            width: 50,
            child: Column(
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    onPressed: () {}),
                InkWell(
                  onTap: () {
                    appState.changeScreen(Screen.DASH);
                  },
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'Dashboard',
                        ),
                      ),
                      Visibility(
                        visible: appState.selectedScreen == Screen.DASH,
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 68,
                              width: 5,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    appState.changeScreen(Screen.PRODUCTS);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddProduct()));
                  },
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'todayProducts',
                        ),
                      ),
                      Visibility(
                        visible: appState.selectedScreen == Screen.PRODUCTS,
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 58,
                              width: 5,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    appState.changeScreen(Screen.CATEGORIES);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddProducts()));
                  },
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'famousProduct',
                        ),
                      ),
                      Visibility(
                        visible: appState.selectedScreen == Screen.CATEGORIES,
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 68,
                              width: 5,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    appState.changeScreen(Screen.BRANDS);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => AddProductss()));
                  },
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          'drinkProduct',
                        ),
                      ),
                      Visibility(
                        visible: appState.selectedScreen == Screen.BRANDS,
                        child: Wrap(
                          children: <Widget>[
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 48,
                              width: 5,
                              color: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      appState.changeScreen(Screen.ORDERS);
                    },
                    child: Wrap(
                      direction: Axis.horizontal,
                      children: <Widget>[
                        RotatedBox(
                          quarterTurns: -1,
                          child: Text(
                            'Orders',
                          ),
                        ),
                        Visibility(
                          visible: appState.selectedScreen == Screen.ORDERS,
                          child: Wrap(
                            children: <Widget>[
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 48,
                                width: 5,
                                color: Colors.black,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(icon: Icon(Icons.open_in_new), onPressed: () {})
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: 'Revenue\n',
                        style: TextStyle(fontSize: 35, color: Colors.grey)),
                    TextSpan(
                        text: '\$1287.99',
                        style: TextStyle(
                            fontSize: 55,
                            color: Colors.black,
                            fontWeight: FontWeight.w300)),
                  ]),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SmallCard(
                    color2: Colors.indigo,
                    color1: Colors.blue,
                    icon: Icons.person_outline,
                    value: 20,
                    title: 'Users',
                  ),
                  SmallCard(
                    color2: Colors.indigo,
                    color1: Colors.blue,
                    icon: Icons.shopping_cart,
                    value: 30,
                    title: 'Orders',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SmallCard(
                    color2: Colors.black87,
                    color1: Colors.black87,
                    icon: Icons.attach_money,
                    value: 65,
                    title: 'Sales',
                  ),
                  SmallCard(
                    color2: Colors.black,
                    color1: Colors.black87,
                    icon: Icons.shopping_basket,
                    value: 230,
                    title: 'Stock',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Sales per category',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(1.0, 1.0),
                              blurRadius: 4)
                        ]),
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: ListTile(
                        // title: charts.PieChart(_seriesPieData,
                        // animate: true,
                        //   animationDuration: Duration(seconds: 3),
                        // behaviors: [
                        // charts.DatumLegend(
                        //  outsideJustification:
                        //     charts.OutsideJustification.endDrawArea,
                        //  horizontalFirst: false,
                        //  desiredMaxRows: 2,
                        //  cellPadding:
                        //    EdgeInsets.only(right: 4.0, bottom: 4.0),
                        // )
                        //],
                        //   defaultRenderer: charts.ArcRendererConfig(
                        // arcWidth: 30,
                        // arcRendererDecorators: [
                        //   charts.ArcLabelDecorator(
                        //       labelPosition:
                        //           charts.ArcLabelPosition.inside)
                        // ])),
                        ),
                  ),
                ),
              )
            ],
          )
        ],
      )),
    );
  }
}

class Task {
  String task;
  double taskvalue;
  Color colorval;

  Task(this.task, this.taskvalue, this.colorval);
}
