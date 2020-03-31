import 'package:daily_helper/apps/currency_converter/ui/currency_converter.dart';
import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_food/ui/which_food.dart';
import 'package:daily_helper/apps/which_food/ui/which_food_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/ui/home_tab.dart';
import 'package:daily_helper/ui/widget/custom_drawer.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

import '../app_localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pageControle = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: _pageControle,
      children: <Widget>[
        Scaffold(
          drawer: CustomDrawer(_pageControle),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate(StringKey.HOME)),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: HomeTab(),
          backgroundColor: Colors.grey[900],
        ),
        Scaffold(
            drawer: CustomDrawer(_pageControle),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_FUEL)),
              centerTitle: true,
              backgroundColor: WhichFuelColors.PRIMARY_COLOR,
            ),
            body: WhichFuel()
        ),
        Scaffold(
            drawer: CustomDrawer(_pageControle),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_DRINK)),
              centerTitle: true,
              backgroundColor: WhichDrinkColors.PRIMARY_COLOR,
            ),
            body: WhichDrink()
        ),
        Scaffold(
            drawer: CustomDrawer(_pageControle),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_FOOD)),
              centerTitle: true,
              backgroundColor: WhichFoodColors.PRIMARY_COLOR,
            ),
            body: WhichFood()
        ),
        Scaffold(
            drawer: CustomDrawer(_pageControle),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate(StringKey.CURRENCY_CONVERTER)),
              centerTitle: true,
              backgroundColor: CurrencyConverterColors.PRIMARY_COLOR,
            ),
            body: CurrencyConverter()
        )
      ],
    );
  }
}