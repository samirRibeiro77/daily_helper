import 'package:flutter/cupertino.dart';

class WhichDrinkMath {
  double _score1;
  double _score2;

  WhichDrinkMath({
    @required drink1Price,
    @required drink1Qtd,
    @required drink2Price,
    @required drink2Qtd}){
      this._score1 = drink1Qtd / drink1Price;
      this._score2 = drink2Qtd / drink2Price;
  }

  double get score2 => _score2;
  double get score1 => _score1;
}