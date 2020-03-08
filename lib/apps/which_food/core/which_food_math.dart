import 'package:flutter/cupertino.dart';

class WhichFoodMath {
  double _score1;
  double _score2;

  WhichFoodMath({
    @required food1Price,
    @required food1Qtd,
    @required food2Price,
    @required food2Qtd}){
      this._score1 = food1Qtd / food1Price;
      this._score2 = food2Qtd / food2Price;
  }

  double get score2 => _score2;
  double get score1 => _score1;
}