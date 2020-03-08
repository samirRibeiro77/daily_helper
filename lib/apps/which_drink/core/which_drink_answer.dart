import 'package:daily_helper/apps/which_drink/core/which_drink_math.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/cupertino.dart';

import '../../../app_localizations.dart';

class WhichDrinkAnswer {
  final double D1Price;
  final double D1Qtd;
  final double D2Price;
  final double D2Qtd;

  double _drink1;
  double _drink2;

  WhichDrinkAnswer({
    @required this.D1Price,
    @required this.D1Qtd,
    @required this.D2Price,
    @required this.D2Qtd}){
      _doMath();
  }

  void _doMath() {
    final math = WhichDrinkMath(
      drink1Price: this.D1Price,
      drink1Qtd: this.D1Qtd,
      drink2Price: this.D2Price,
      drink2Qtd: this.D2Qtd
    );

    _drink1 = math.score1;
    _drink2 = math.score2;
  }

  String result(BuildContext context) {
    if (_drink1 > _drink2) {
      return AppLocalizations.of(context).translate(StringKey.DRINK_1);
    }
    if (_drink1 < _drink2) {
      return AppLocalizations.of(context).translate(StringKey.DRINK_2);
    }

    return AppLocalizations.of(context).translate(StringKey.BOTH_DRINK);
  }
}