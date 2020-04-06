import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/home/ui/home_colors.dart';
import 'package:daily_helper/ui/widget/apps_tile.dart';
import 'package:daily_helper/util/apps_enum.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

class HomeHome extends StatefulWidget {
  final PageController _pageControler;

  HomeHome(this._pageControler);

  @override
  _HomeHomeState createState() => _HomeHomeState(_pageControler);
}

class _HomeHomeState extends State<HomeHome> {
  final PageController _pageControler;

  _HomeHomeState(this._pageControler);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            AppLocalizations.of(context).translate(StringKey.APP_NAME),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 100.0,
                color: HomeColors.TEXT_COLOR
            ),
          ),
        ),
        SizedBox(height: 50.0),
        SingleChildScrollView(
          padding: EdgeInsets.all(15.0),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: <Widget>[
              AppsTile(AppsEnum.split_bills, _pageControler, 1),
              AppsTile(AppsEnum.which_fuel, _pageControler, 2),
              AppsTile(AppsEnum.which_drink, _pageControler, 3),
              AppsTile(AppsEnum.which_food, _pageControler, 4),
              AppsTile(AppsEnum.currency_converter, _pageControler, 5),
            ],
          ),
        )
      ],
    );
  }
}
