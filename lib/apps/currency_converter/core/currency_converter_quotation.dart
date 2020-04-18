import 'package:daily_helper/apps/currency_converter/core/currency_converter_coin.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CurrencyConverterQuotation {
  static const String requestUrl = "https://api.hgbrasil.com/finance?format=json&key=ea3cbde1";
  CurrencyConverterCoin _usd, _euro, _btc;

  Future<Map> getData() async {
    var httpRequest = await http.get(requestUrl);
    var quotationJson = json.decode(httpRequest.body);

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