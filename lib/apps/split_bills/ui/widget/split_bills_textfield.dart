import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:flutter/material.dart';

class SplitBillsTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Function onChangeFunction;
  final Function onSubmitFunction;
  final bool isNumber;

  SplitBillsTextField({
    this.label,
    this.controller,
    this.isNumber = false,
    this.onChangeFunction,
    this.onSubmitFunction
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: TextField(
        style: TextStyle(color: SplitBillsColors.TEXT_COLOR, fontSize: 15.0),
        controller: controller,
        onChanged: (val) { onChangeFunction(); },
        onSubmitted: (val) { onSubmitFunction(); },
        keyboardType: isNumber
            ? TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: SplitBillsColors.PRIMARY_COLOR)
        ),
      ),
    );
  }
}
