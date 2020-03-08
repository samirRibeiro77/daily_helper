import 'package:daily_helper/apps/currency_converter/core/currency_converter_api.dart';
import 'package:daily_helper/apps/currency_converter/core/currency_converter_coin.dart';
import 'dart:async';

class CurrencyConverterQuotation {
  CurrencyConverterCoin _usd, _euro, _btc;

  Future<Map> getData() async {
    var httpRequest = CurrencyConverterApi(CurrencyConverterApi.REQUEST_URL);
    var quotationJson = await httpRequest.data;

    _usd = CurrencyConverterCoin(
        quotationJson["results"]["currencies"]["USD"]["buy"],
        quotationJson["results"]["currencies"]["USD"]["sell"]
    );

    _euro = CurrencyConverterCoin(
        quotationJson["results"]["currencies"]["EUR"]["buy"],
        quotationJson["results"]["currencies"]["EUR"]["sell"]
    );

    _btc = CurrencyConverterCoin(
        quotationJson["results"]["currencies"]["BTC"]["buy"],
        quotationJson["results"]["currencies"]["BTC"]["sell"]
    );

    print(quotation);
    return quotationJson;
  }

  double get usd => _usd.value;
  double get eu => _euro.value;
  double get btc => _btc.value;

  get quotation => "Dollar: ${usd.toStringAsFixed(2)}\nEuro: ${eu.toStringAsFixed(2)}\nBitcoin: ${btc.toStringAsFixed(2)}";

  double eurToReal(value) {
    return value * eu;
  }

  double usdToReal(value) {
    return value * usd;
  }

  double btcToReal(value) {
    return value * btc;
  }
}