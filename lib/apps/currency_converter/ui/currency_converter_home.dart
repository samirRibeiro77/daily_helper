import 'package:daily_helper/apps/currency_converter/core/currency_converter_coin.dart';
import 'package:daily_helper/apps/currency_converter/core/currency_converter_quotation.dart';
import 'package:daily_helper/apps/currency_converter/ui/currency_converter_colors.dart';
import 'package:daily_helper/apps/currency_converter/ui/widget/currency_converter_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import '../../../app_localizations.dart';

class CurrencyConverterHome extends StatefulWidget {
  @override
  _CurrencyConverterHomeState createState() => _CurrencyConverterHomeState();
}

class _CurrencyConverterHomeState extends State<CurrencyConverterHome> {
  var _quotation = CurrencyConverterQuotation();
  final _realController = TextEditingController();
  final _dollarController = TextEditingController();
  final _euroController = TextEditingController();
  final _bitcoinController = TextEditingController();

  void _realChanged(String valueText) {
    if (valueText.isEmpty) {
      _clearAll();
      return;
    }

    var amount = double.parse(valueText);
    _dollarController.text = (amount / _quotation.usd).toStringAsFixed(2);
    _euroController.text = (amount / _quotation.eu).toStringAsFixed(2);
    _bitcoinController.text = (amount / _quotation.btc).toStringAsFixed(10);
  }

  void _dollarChanged(String valueText) {
    if (valueText.isEmpty) {
      _clearAll();
      return;
    }

    var amount = double.parse(valueText);
    var real = _quotation.usdToReal(amount);
    _realController.text = real.toStringAsFixed(2);
    _euroController.text = (real / _quotation.eu).toStringAsFixed(2);
    _bitcoinController.text = (real / _quotation.btc).toStringAsFixed(10);
  }

  void _euroChanged(String valueText) {
    if (valueText.isEmpty) {
      _clearAll();
      return;
    }

    var amount = double.parse(valueText);
    var real = _quotation.eurToReal(amount);
    _realController.text = real.toStringAsFixed(2);
    _dollarController.text = (real / _quotation.usd).toStringAsFixed(2);
    _bitcoinController.text = (real / _quotation.btc).toStringAsFixed(10);
  }

  void _bitcoinChanged(String valueText) {
    if (valueText.isEmpty) {
      _clearAll();
      return;
    }

    var amount = double.parse(valueText);
    var real = _quotation.btcToReal(amount);
    _realController.text = real.toStringAsFixed(2);
    _dollarController.text = (real / _quotation.usd).toStringAsFixed(2);
    _euroController.text = (real / _quotation.eu).toStringAsFixed(2);
  }

  void _clearAll() {
    _realController.text = "";
    _dollarController.text = "";
    _euroController.text = "";
    _bitcoinController.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _quotation.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
                child: Text(
                  AppLocalizations.of(context).translate(StringKey.LOADING),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: CurrencyConverterColors.PRIMARY_COLOR
                  ),
                )
            );
          default:
            if (snapshot.hasError) {
              return Center(child: Text("ERRO"));
            }

            return ListView(
              padding: EdgeInsets.all(10.0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Icon(
                      Icons.monetization_on,
                      size: 150.0,
                      color: CurrencyConverterColors.PRIMARY_COLOR
                  ),
                ),
                CurrencyConverterTextfield(
                    AppLocalizations.of(context).translate(StringKey.BRL),
                    CurrencyConverterCoin.BRL,
                    _realController,
                    _realChanged
                ),
                SizedBox(child: Container(height: 10.0)),
                CurrencyConverterTextfield(
                    AppLocalizations.of(context).translate(StringKey.USD),
                    CurrencyConverterCoin.USD,
                    _dollarController,
                    _dollarChanged
                ),
                SizedBox(child: Container(height: 10.0)),
                CurrencyConverterTextfield(
                    AppLocalizations.of(context).translate(StringKey.EUR),
                    CurrencyConverterCoin.EUR,
                    _euroController,
                    _euroChanged
                ),
                SizedBox(child: Container(height: 10.0)),
                CurrencyConverterTextfield(
                    AppLocalizations.of(context).translate(StringKey.BTC),
                    CurrencyConverterCoin.BTC,
                    _bitcoinController,
                    _bitcoinChanged
                )
              ],
            );
        }
      },
    );
  }
}
