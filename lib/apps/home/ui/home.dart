import 'package:daily_helper/apps/home/ui/home_colors.dart';
import 'package:daily_helper/apps/home/ui/home_home.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final PageController _pageControler;

  Home(this._pageControler);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HomeColors.BACKGROUND_COLOR,
      child: HomeHome(_pageControler),
    );
  }
}

