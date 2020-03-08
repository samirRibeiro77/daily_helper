import 'package:daily_helper/apps/which_drink/core/which_drink_answer.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class WhichDrinkHome extends StatefulWidget {
  @override
  _WhichDrinkHomeState createState() => _WhichDrinkHomeState();
}

class _WhichDrinkHomeState extends State<WhichDrinkHome> {
  @override
  Widget build(BuildContext context) {
    final _d1MeasureController = TextEditingController();
    final _d1PriceController = TextEditingController();
    final _d2MeasureController = TextEditingController();
    final _d2PriceController = TextEditingController();
    final _whichDrinkController = TextEditingController();

    void _valuesChange() {
      if(_d1MeasureController.text.isEmpty
        |_d1PriceController.text.isEmpty
        |_d2MeasureController.text.isEmpty
        |_d2PriceController.text.isEmpty) {
          _whichDrinkController.text = "";
          return;
      }

      var d1MeasureValue = double.parse(_d1MeasureController.value.text.replaceAll(',', '.'));
      var d1PriceValue = double.parse(_d1PriceController.value.text.replaceAll(',', '.'));
      var d2MeasureValue = double.parse(_d2MeasureController.value.text.replaceAll(',', '.'));
      var d2PriceValue = double.parse(_d2PriceController.value.text.replaceAll(',', '.'));

      var answer = WhichDrinkAnswer(
        D1Price: d1PriceValue,
        D1Qtd: d1MeasureValue,
        D2Price: d2PriceValue,
        D2Qtd: d2MeasureValue
      );

      _whichDrinkController.text = answer.result(context);
    }

    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 200.0,
            child: Image.asset('assets/images/which_drink_icon.png'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.DRINK_1),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.DRINK_2),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
            SizedBox(child: Container(width: 20.0))
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: _d1MeasureController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.DRINK_MEASURE),
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  controller: _d2MeasureController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.DRINK_MEASURE),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  )
              ),
            )
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                controller: _d1PriceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.DRINK_PRICE),
                    labelStyle: TextStyle(color: Colors.black),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: Colors.black, fontSize: 15.0),
                  controller: _d2PriceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.DRINK_PRICE),
                      labelStyle: TextStyle(color: Colors.black),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.black))
                  )
              ),
            )
          ],
        ),
        TextField(
          enabled: false,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black, fontSize: 20.0),
          controller: _whichDrinkController,
        )
      ],
    );
  }
}
