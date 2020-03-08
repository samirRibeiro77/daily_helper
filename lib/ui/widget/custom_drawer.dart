import 'package:daily_helper/util/apps_enum.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';
import 'drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  final PageController _pageControler;

  CustomDrawer(this._pageControler);

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.white, Colors.black26],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter)),
    );

    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 80.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 8.0,
                      left: 0.0,
                      child: Text(
                        AppLocalizations.of(context).translate(StringKey.APP_NAME),
                        style: TextStyle(
                            fontSize: 34.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              DrawerTile(AppsEnum.home, _pageControler, 0),
              DrawerTile(AppsEnum.which_fuel, _pageControler, 1),
              DrawerTile(AppsEnum.which_drink, _pageControler, 2),
              DrawerTile(AppsEnum.which_food, _pageControler, 3)
            ],
          )
        ],
      ),
    );
  }
}
