class WhichFuelMath {
  static const MAX_VALUE = 0.7;
  double _totalValue;

  WhichFuelMath(double alcohol, double gasoline) {
    this._totalValue = alcohol / gasoline;
  }

  double get totalValue => _totalValue;
  double get maxValue => MAX_VALUE;
}