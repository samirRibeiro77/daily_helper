import 'package:daily_helper/apps/which_food/core/which_food_answer.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import '../../../app_localizations.dart';

class WhichFoodHome extends StatefulWidget {
  @override
  _WhichFoodHomeState createState() => _WhichFoodHomeState();
}

class _WhichFoodHomeState extends State<WhichFoodHome> {
  @override
  Widget build(BuildContext context) {
    final _f1MeasureController = TextEditingController();
    final _f1PriceController = TextEditingController();
    final _f2MeasureController = TextEditingController();
    final _f2PriceController = TextEditingController();
    final _whichFoodController = TextEditingController();

    void _valuesChange() {
      if(_f1MeasureController.text.isEmpty
        |_f1PriceController.text.isEmpty
        |_f2MeasureController.text.isEmpty
        |_f2PriceController.text.isEmpty) {
          _whichFoodController.text = "";
          return;
      }

      var f1MeasureValue = double.parse(_f1MeasureController.value.text.replaceAll(',', '.'));
      var f1PriceValue = double.parse(_f1PriceController.value.text.replaceAll(',', '.'));
      var f2MeasureValue = double.parse(_f2MeasureController.value.text.replaceAll(',', '.'));
      var f2PriceValue = double.parse(_f2PriceController.value.text.replaceAll(',', '.'));

      var answer = WhichFoodAnswer(
        F1Price: f1PriceValue,
        F1Qtd: f1MeasureValue,
        F2Price: f2PriceValue,
        F2Qtd: f2MeasureValue
      );

      _whichFoodController.text = answer.result(context);
    }

    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(20),
          child: Container(
            height: 200.0,
            child: Image.asset('assets/images/which_food_icon.png'),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.FOOD_1),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.yellow),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.FOOD_2),
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.yellow),
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
                style: TextStyle(color: Colors.yellow, fontSize: 15.0),
                controller: _f1MeasureController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.FOOD_MEASURE),
                    labelStyle: TextStyle(color: Colors.yellow),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: Colors.yellow, fontSize: 15.0),
                  controller: _f2MeasureController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.FOOD_MEASURE),
                      labelStyle: TextStyle(color: Colors.yellow),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow))
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
                style: TextStyle(color: Colors.yellow, fontSize: 15.0),
                controller: _f1PriceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.FOOD_PRICE),
                    labelStyle: TextStyle(color: Colors.yellow),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: Colors.yellow, fontSize: 15.0),
                  controller: _f2PriceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.FOOD_PRICE),
                      labelStyle: TextStyle(color: Colors.yellow),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow))
                  )
              ),
            )
          ],
        ),
        TextField(
          enabled: false,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.yellow, fontSize: 20.0),
          controller: _whichFoodController,
        )
      ],
    );
  }
}
