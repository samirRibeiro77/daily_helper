import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_food/ui/which_food_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/util/apps_enum.dart';
import 'package:flutter/material.dart';
import 'package:daily_helper/util/string_key.dart';
import '../../app_localizations.dart';

class DrawerTile extends StatelessWidget {
  final AppsEnum _appEnum;
  final PageController _pageController;
  final int _page;

  DrawerTile(this._appEnum, this._pageController, this._page);

  @override
  Widget build(BuildContext context) {
    String _getRowName() {
      switch (_appEnum) {
        case AppsEnum.which_fuel: return AppLocalizations.of(context).translate(StringKey.WHICH_FUEL);
        case AppsEnum.which_drink: return AppLocalizations.of(context).translate(StringKey.WHICH_DRINK);
        case AppsEnum.which_food: return AppLocalizations.of(context).translate(StringKey.WHICH_FOOD);
        case AppsEnum.currency_converter: return AppLocalizations.of(context).translate(StringKey.CURRENCY_CONVERTER);
        case AppsEnum.info: return AppLocalizations.of(context).translate(StringKey.INFO);
        case AppsEnum.split_bills: return AppLocalizations.of(context).translate(StringKey.SPLIT_BILLS);
        default: return AppLocalizations.of(context).translate(StringKey.HOME);
      }
    }

    IconData _getRowIcon() {
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

    Color _getRowColor() {
      switch (_appEnum) {
        case AppsEnum.which_fuel: return WhichFuelColors.PRIMARY_COLOR;
        case AppsEnum.which_drink: return WhichDrinkColors.PRIMARY_COLOR;
        case AppsEnum.which_food: return WhichFoodColors.PRIMARY_COLOR;
        case AppsEnum.currency_converter: return CurrencyConverterColors.PRIMARY_COLOR;
        case AppsEnum.split_bills: return SplitBillsColors.PRIMARY_COLOR;
        default: return Theme.of(context).primaryColor;
      }
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          _pageController.jumpToPage(_page);
        },
        child: Container(
          height: 60.0,
          child: Row(
            children: <Widget>[
              Icon(
                  _getRowIcon(),
                  size: 32.0,
                  color: _pageController.page.round() == _page
                      ? _getRowColor()
                      : Colors.grey[700]
              ),
              SizedBox(width: 32.0),
              Text(
                _getRowName(),
                style: TextStyle(
                    fontSize: 16.0,
                    color: _pageController.page.round() == _page
                        ? _getRowColor()
                        : Colors.grey[700]
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
