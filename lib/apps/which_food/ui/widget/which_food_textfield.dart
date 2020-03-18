import 'package:flutter/material.dart';
import '../which_food_colors.dart';

class WhichFoodTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function function;

  WhichFoodTextField({this.label, this.controller, this.function});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        style: TextStyle(color: WhichFoodColors.TEXT_COLOR, fontSize: 15.0),
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (value){ function(); },
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: WhichFoodColors.PRIMARY_COLOR),
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.PRIMARY_COLOR)),
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.PRIMARY_COLOR))
        ),
      ),
    );
  }
}
