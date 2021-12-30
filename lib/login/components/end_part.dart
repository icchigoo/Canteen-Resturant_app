// ignore_for_file: prefer_const_constructors

import 'package:canteen_app/route/routing_page.dart';
import 'package:canteen_app/signup/signup_page.dart';
import 'package:canteen_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class EndPart extends StatelessWidget {
  final void Function()? onPressed;
  final bool loading;
  const EndPart({
    required this.loading,
    required this.onPressed,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading == true
            ? CircularProgressIndicator()
            : MyButton(
                onPressed: onPressed,
                text: "LOG IN",
              ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account?\t\t"),
            GestureDetector(
              onTap: () {
                RoutingPage.goTonext(
                  context: context,
                  navigateTo: SignupPage(),
                );
              },
              child: Text("SIGN UP"),
            ),
          ],
        )
      ],
    );
  }
}
