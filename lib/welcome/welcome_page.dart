// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'components/center_part.dart';
import 'components/end_part.dart';
import 'components/top_part.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //top part

              TopPart(),
              //Center PArt
              CenterPart(),
              // end part
              EndPart(),
            ],
          ),
        ),
      ),
    );
  }
}
