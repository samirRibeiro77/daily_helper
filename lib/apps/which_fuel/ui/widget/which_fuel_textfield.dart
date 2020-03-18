import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:flutter/material.dart';

class WhichFuelTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function function;

  WhichFuelTextField({this.label, this.controller, this.function});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        style: TextStyle(color: WhichFuelColors.TEXT_COLOR, fontSize: 15.0),
        controller: controller,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        onChanged: (value){ function(); },
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: WhichFuelColors.PRIMARY_COLOR),
            focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: WhichFuelColors.PRIMARY_COLOR)),
            enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: WhichFuelColors.PRIMARY_COLOR))
        ),
      ),
    );
  }
}
