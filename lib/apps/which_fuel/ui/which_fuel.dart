import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/which_fuel_home.dart';
import 'package:flutter/material.dart';

class WhichFuel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WhichFuelColors.BACKGROUND_COLOR,
      child: WhichFuelHome(),
    );
  }
}

