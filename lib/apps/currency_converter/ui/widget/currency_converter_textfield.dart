import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:flutter/material.dart';

class CurrencyConverterTextfield extends StatelessWidget {
  final String _label;
  final String _prefix;
  final TextEditingController _controller;
  final Function _function;


  CurrencyConverterTextfield(this._label, this._prefix, this._controller,
      this._function);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: CurrencyConverterColors.TEXT_COLOR, fontSize: 20.0),
      controller: _controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: _function,
      decoration: InputDecoration(
          labelText: _label,
          labelStyle: TextStyle(
              color: CurrencyConverterColors.PRIMARY_COLOR
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: CurrencyConverterColors.PRIMARY_COLOR
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: CurrencyConverterColors.PRIMARY_COLOR
              )
          ),
          prefixStyle: TextStyle(
              color: CurrencyConverterColors.PRIMARY_COLOR,
              fontSize: 25.0
          ),
          prefixText: _prefix + " "),
    );
  }
}
