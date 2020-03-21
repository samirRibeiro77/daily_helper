import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_food/ui/which_food_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/ui/home_colors.dart';
import 'package:daily_helper/util/apps_enum.dart';
import 'package:flutter/material.dart';

class ColorScheme {
  Color _primary, _text, _background;

  ColorScheme(AppsEnum app) {
    switch(app) {
      case AppsEnum.which_fuel: {
        _primary = WhichFuelColors.PRIMARY_COLOR;
        _text = WhichFuelColors.TEXT_COLOR;
        _background = WhichFuelColors.BACKGROUND_COLOR;
        break;
      }
      case AppsEnum.which_drink: {
        _primary = WhichDrinkColors.PRIMARY_COLOR;
        _text = WhichDrinkColors.TEXT_COLOR;
        _background = WhichDrinkColors.BACKGROUND_COLOR;
        break;
      }
      case AppsEnum.which_food: {
        _primary = WhichFoodColors.PRIMARY_COLOR;
        _text = WhichFoodColors.TEXT_COLOR;
        _background = WhichFoodColors.BACKGROUND_COLOR;
        break;
      }
      case AppsEnum.currency_converter: {
        _primary = CurrencyConverterColors.PRIMARY_COLOR;
        _text = CurrencyConverterColors.TEXT_COLOR;
        _background = CurrencyConverterColors.BACKGROUND_COLOR;
        break;
      }
      default: {
        _primary = HomeColors.PRIMARY_COLOR;
        _text = HomeColors.TEXT_COLOR;
        _background = HomeColors.BACKGROUND_COLOR;
      }
    }
  }

  Color get background => _background;
  Color get text => _text;
  Color get primary => _primary;
}