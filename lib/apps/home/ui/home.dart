import 'package:daily_helper/apps/home/ui/home_home.dart';
import 'package:daily_helper/apps/info/ui/info_colors.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: InfoColors.BACKGROUND_COLOR,
      child: HomeHome(),
    );
  }
}

