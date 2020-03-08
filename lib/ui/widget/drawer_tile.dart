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
        default: return AppLocalizations.of(context).translate(StringKey.HOME);
      }
    }

    IconData _getRowIcon() {
      switch (_appEnum) {
        case AppsEnum.which_fuel: return Icons.local_gas_station;
        case AppsEnum.which_drink: return Icons.local_drink;
        case AppsEnum.which_food: return Icons.fastfood;
        case AppsEnum.currency_converter: return Icons.monetization_on;
        default: return Icons.home;
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
                      ? Theme.of(context).primaryColor
                      : Colors.grey[700]
              ),
              SizedBox(width: 32.0),
              Text(
                _getRowName(),
                style: TextStyle(
                    fontSize: 16.0,
                    color: _pageController.page.round() == _page
                        ? Theme.of(context).primaryColor
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
