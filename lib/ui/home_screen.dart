import 'package:daily_helper/apps/currency_converter/ui/currency_converter.dart';
import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:daily_helper/apps/info/ui/info.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_food/ui/which_food.dart';
import 'package:daily_helper/apps/which_food/ui/which_food_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/apps/home/ui/home.dart';
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
          body: Home(_pageControle),
          backgroundColor: Colors.grey[900],
        ),
        Theme(
          data: ThemeData(
            primarySwatch: SplitBillsColors.PRIMARY_COLOR,
          ),
          child: Scaffold(
              drawer: CustomDrawer(_pageControle),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).translate(StringKey.SPLIT_BILLS)),
                centerTitle: true,
              ),
              body: SplitBills(_pageControle)
          ),
        ),
        Theme(
          data: ThemeData(
            primarySwatch: WhichFuelColors.PRIMARY_COLOR
          ),
          child: Scaffold(
              drawer: CustomDrawer(_pageControle),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_FUEL)),
                centerTitle: true,
              ),
              body: WhichFuel()
          ),
        ),
        Theme(
          data: ThemeData(
            primarySwatch: WhichDrinkColors.PRIMARY_COLOR
          ),
          child: Scaffold(
              drawer: CustomDrawer(_pageControle),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_DRINK)),
                centerTitle: true,
              ),
              body: WhichDrink()
          ),
        ),
        Theme(
          data: ThemeData(
            primarySwatch: WhichFoodColors.PRIMARY_COLOR
          ),
          child: Scaffold(
              drawer: CustomDrawer(_pageControle),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_FOOD)),
                centerTitle: true,
              ),
              body: WhichFood()
          ),
        ),
        Theme(
          data: ThemeData(
            primarySwatch: CurrencyConverterColors.PRIMARY_COLOR
          ),
          child: Scaffold(
              drawer: CustomDrawer(_pageControle),
              appBar: AppBar(
                title: Text(AppLocalizations.of(context).translate(StringKey.CURRENCY_CONVERTER)),
                centerTitle: true,
              ),
              body: CurrencyConverter()
          ),
        ),
        Scaffold(
          drawer: CustomDrawer(_pageControle),
          appBar: AppBar(
            title: Text(AppLocalizations.of(context).translate(StringKey.INFO)),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          body: Info(),
        ),
      ],
    );
  }
}