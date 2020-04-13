
import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:daily_helper/apps/home/ui/home_colors.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_food/ui/which_food_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/util/apps_enum.dart';
import 'package:flutter/material.dart';

class AppsTile extends StatelessWidget {
  final AppsEnum _appEnum;
  final PageController _pageController;
  final int _page;

  AppsTile(this._appEnum, this._pageController, this._page);

  @override
  Widget build(BuildContext context) {
    IconData _getIcon() {
      switch (_appEnum) {
        case AppsEnum.which_fuel: return Icons.local_gas_station;
        case AppsEnum.which_drink: return Icons.local_drink;
        case AppsEnum.which_food: return Icons.fastfood;
        case AppsEnum.currency_converter: return Icons.monetization_on;
        case AppsEnum.info: return Icons.info;
        case AppsEnum.split_bills: return Icons.attach_money;
        default: return Icons.home;
      }
    }

    Color _getColor() {
      switch (_appEnum) {
        case AppsEnum.which_fuel: return WhichFuelColors.PRIMARY_COLOR;
        case AppsEnum.which_drink: return WhichDrinkColors.PRIMARY_COLOR;
        case AppsEnum.which_food: return WhichFoodColors.PRIMARY_COLOR;
        case AppsEnum.currency_converter: return CurrencyConverterColors.PRIMARY_COLOR;
        case AppsEnum.split_bills: return SplitBillsColors.PRIMARY_COLOR;
        default: return Theme.of(context).primaryColor;
      }
    }

    return GestureDetector(
      onTap: (){ _pageController.jumpToPage(_page); },
      child: Container(
        height: 300.0,
        child: Card(
          color: HomeColors.CARD_BACKGROUND_COLOR,
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(_getIcon(), size: 100.0, color: _getColor()),
          ),
        ),
      ),
    );
  }
}
