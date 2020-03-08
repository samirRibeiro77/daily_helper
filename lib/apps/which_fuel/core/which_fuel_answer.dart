import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/which_fuel/core/which_fuel_fuel.dart';
import 'package:daily_helper/apps/which_fuel/core/which_fuel_math.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/cupertino.dart';

class WhichFuelAnswer {
  final double _alcohol;
  final double _gasoline;
  Fuel _choose;

  WhichFuelAnswer(this._alcohol, this._gasoline) {
    _doMath();
  }

  void _doMath() {
    final math = WhichFuelMath(_alcohol, _gasoline);
    if (math.totalValue < math.maxValue) {
      _choose = Fuel.alcohol;
      return;
    }
    _choose = Fuel.gasoline;
  }

  String result(BuildContext context) {
    switch(_choose) {
      case Fuel.alcohol: return AppLocalizations.of(context).translate(StringKey.ALCOHOL);
      case Fuel.gasoline: return AppLocalizations.of(context).translate(StringKey.GASOLINE);
      default: return "";
    }
  }
}