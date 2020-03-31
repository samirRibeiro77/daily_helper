import 'package:daily_helper/apps/info/ui/info_colors.dart';
import 'package:daily_helper/apps/info/ui/info_home.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: InfoColors.BACKGROUND_COLOR,
      child: InfoHome(),
    );
  }
}

