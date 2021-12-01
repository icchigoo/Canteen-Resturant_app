// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/config/colors.dart';
import 'package:canteen_app/screens/home/drawer_side.dart';
import 'package:flutter/material.dart';

class MyProfile extends StatelessWidget {
  @override
  Widget listTile({required IconData icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        // ignore: prefer_const_constructors
        title: Text(
          "My Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(children: [
            Container(
              height: 100,
              color: primaryColor,
            ),
            Container(
              height: 548,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: ListView(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 250,
                        height: 80,
                        padding: EdgeInsets.only(left: 30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // ignore: prefer_const_literals_to_create_immutables
                              children: [
                                Text(
                                  "Ajay Chhetri",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: textColor,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("icchigoo12@gmail.com"),
                              ],
                            ),
                            CircleAvatar(
                                radius: 15,
                                backgroundColor: primaryColor,
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(
                                    Icons.edit,
                                    color: primaryColor,
                                  ),
                                  backgroundColor: scaffoldBackgroundColor,
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                  listTile(icon: Icons.shop_outlined, title: "My Orders"),
                  listTile(
                      icon: Icons.location_on_outlined,
                      title: "My Delivery Address"),
                  listTile(
                      icon: Icons.person_outline, title: "Refer A Friends"),
                  listTile(
                      icon: Icons.file_copy_outlined,
                      title: "Terms & Conditions"),
                  listTile(
                      icon: Icons.policy_outlined, title: "Privacy Policy"),
                  listTile(icon: Icons.add_chart, title: "About"),
                  listTile(icon: Icons.exit_to_app_outlined, title: "Log Out"),
                ],
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.kindpng.com/picc/m/382-3826731_grab-food-logo-png-transparent-png.png"),
                radius: 45,
                backgroundColor: scaffoldBackgroundColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
