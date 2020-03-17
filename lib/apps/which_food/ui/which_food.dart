import 'package:daily_helper/apps/which_food/ui/which_food_colors.dart';
import 'package:daily_helper/apps/which_food/ui/which_food_home.dart';
import 'package:flutter/material.dart';

class WhichFood extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: WhichFoodColors.BACKGROUND_COLOR,
      child: WhichFoodHome(),
    );
  }
}

