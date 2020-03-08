import 'package:daily_helper/apps/which_fuel/ui/which_fuel.dart';
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
          body: HomeTab()
        ),
        Scaffold(
            drawer: CustomDrawer(_pageControle),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate(StringKey.WHICH_FUEL)),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: WhichFuel()
        )
      ],
    );
  }
}