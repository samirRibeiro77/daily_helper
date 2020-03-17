import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:flutter/material.dart';
import 'currency_converter_home.dart';

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CurrencyConverterColors.BACKGROUND_COLOR,
      child: CurrencyConverterHome(),
    );
  }
}

