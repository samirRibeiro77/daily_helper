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
      style: TextStyle(color: Colors.amber, fontSize: 25.0),
      controller: _controller,
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      onChanged: _function,
      decoration: InputDecoration(
          labelText: _label,
          labelStyle: TextStyle(color: Colors.amber),
          focusedBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          enabledBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          prefixText: _prefix + " "),
    );
  }
}
