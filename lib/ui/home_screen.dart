import 'package:daily_helper/ui/home_tab.dart';
import 'package:daily_helper/ui/widget/custom_drawer.dart';
import 'package:flutter/material.dart';

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
            title: Text('About us'),
            centerTitle: true,
          ),
          body: HomeTab(),
        )
      ],
    );
  }
}