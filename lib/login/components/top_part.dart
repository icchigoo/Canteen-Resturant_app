// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/appColors/app_colors.dart';
import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  const TopPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "images/logo1.png",
                scale: 8,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Text(
              "Login",
              style: TextStyle(
                color: AppColors.KblackColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ],
    );
  }
}
