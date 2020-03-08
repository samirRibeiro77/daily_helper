import 'package:daily_helper/apps/currency_converter/core/currency_converter_quotation.dart';
import 'package:daily_helper/apps/currency_converter/ui/widget/currency_converter_textfield.dart';
import 'package:flutter/material.dart';

class CurrencyConverterHome extends StatefulWidget {
  @override
  _CurrencyConverterHomeState createState() => _CurrencyConverterHomeState();
}

class _CurrencyConverterHomeState extends State<CurrencyConverterHome> {
  var quotation = CurrencyConverterQuotation();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: quotation.getData(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            if (snapshot.hasError) {
              return Center(child: Text("ERRO"));
            }

            return SingleChildScrollView(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  CurrencyConverterTextfield("Real", "", TextEditingController(), (){}),
                  Divider(),
                  CurrencyConverterTextfield("Dolar", "", TextEditingController(), (){}),
                  Divider(),
                  CurrencyConverterTextfield("Euro", "", TextEditingController(), (){}),
                  Divider(),
                  CurrencyConverterTextfield("BTC", "", TextEditingController(), (){})
                ],
              ),
            );
        }
      },
    );
  }
}
