import 'package:daily_helper/apps/which_food/core/which_food_math.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/cupertino.dart';
import '../../../app_localizations.dart';

class WhichFoodAnswer {
  final double F1Price;
  final double F1Qtd;
  final double F2Price;
  final double F2Qtd;

  double _food1;
  double _food2;

  WhichFoodAnswer({
    @required this.F1Price,
    @required this.F1Qtd,
    @required this.F2Price,
    @required this.F2Qtd}){
      _doMath();
  }

  void _doMath() {
    final math = WhichFoodMath(
      food1Price: this.F1Price,
      food1Qtd: this.F1Qtd,
      food2Price: this.F2Price,
      food2Qtd: this.F2Qtd
    );

    _food1 = math.score1;
    _food2 = math.score2;
  }

  String result(BuildContext context) {
    if (_food1 > _food2) {
      return AppLocalizations.of(context).translate(StringKey.FOOD_1);
    }
    if (_food1 < _food2) {
      return AppLocalizations.of(context).translate(StringKey.FOOD_2);
    }

    return AppLocalizations.of(context).translate(StringKey.BOTH_FOOD);
  }
}