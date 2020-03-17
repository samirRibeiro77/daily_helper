import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_home.dart';
import 'package:flutter/material.dart';

class WhichDrink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WhichDrinkColors.BACKGROUND_COLOR,
      child: WhichDrinkHome(),
    );
  }
}

