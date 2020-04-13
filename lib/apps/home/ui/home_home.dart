import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/home/core/app_list.dart';
import 'package:daily_helper/apps/home/ui/home_colors.dart';
import 'package:daily_helper/ui/widget/apps_tile.dart';
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

  Widget _createGrid() {
    var appList = AppList.APPS;

    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: appList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemBuilder: (context, index) {
          var app = appList[index];
          return AppsTile(app["app"], _pageControler, app["index"]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
        SizedBox(height: 10.0),
        Expanded(
          child: _createGrid(),
        )
      ],
    );
  }
}
