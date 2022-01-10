// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class CostomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labText;
  final TextInputType? keyboardType;
  CostomTextField({this.controller, this.keyboardType, required this.labText});
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labText,
      ),
    );
  }
}
