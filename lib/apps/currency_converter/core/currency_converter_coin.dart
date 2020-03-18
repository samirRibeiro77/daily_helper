class CurrencyConverterCoin {
  static const String BRL = "R\$";
  static const String USD = "US\$";
  static const String EUR = "€";
  static const String BTC = "BTC\$";

  double _buy, _sell;

  CurrencyConverterCoin(this._buy, this._sell);

  double buyValue(amount)  => amount * _buy;

  double sellValue(amount) => amount * _sell;

  get value => _buy;
}