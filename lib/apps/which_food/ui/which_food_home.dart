import 'package:daily_helper/apps/which_food/core/which_food_answer.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import '../../../app_localizations.dart';
import 'which_food_colors.dart';

class WhichFoodHome extends StatefulWidget {
  @override
  _WhichFoodHomeState createState() => _WhichFoodHomeState();
}

class _WhichFoodHomeState extends State<WhichFoodHome> {
  final _f1MeasureController = TextEditingController();
  final _f1PriceController = TextEditingController();
  final _f2MeasureController = TextEditingController();
  final _f2PriceController = TextEditingController();
  var choose = "";

  void _valuesChange() {
    setState(() {
      choose = _checkFood();
    });
  }

  String _checkFood() {
    if(_f1MeasureController.text.isEmpty
    |_f1PriceController.text.isEmpty
    |_f2MeasureController.text.isEmpty
    |_f2PriceController.text.isEmpty) {
      return "";
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

    return "${AppLocalizations.of(context).translate(StringKey.CHOOSE)} ${answer.result(context)}";
  }

  @override
  Widget build(BuildContext context) {
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
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WhichFoodColors.TEXT_COLOR),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.FOOD_2),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WhichFoodColors.TEXT_COLOR),
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
                style: TextStyle(color: WhichFoodColors.TEXT_COLOR, fontSize: 15.0),
                controller: _f1MeasureController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.FOOD_MEASURE),
                    labelStyle: TextStyle(color: WhichFoodColors.PRIMARY_COLOR),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: WhichFoodColors.TEXT_COLOR, fontSize: 15.0),
                  controller: _f2MeasureController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.FOOD_MEASURE),
                      labelStyle: TextStyle(color: WhichFoodColors.PRIMARY_COLOR),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR))
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
                style: TextStyle(color: WhichFoodColors.TEXT_COLOR, fontSize: 15.0),
                controller: _f1PriceController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.FOOD_PRICE),
                    labelStyle: TextStyle(color: WhichFoodColors.PRIMARY_COLOR),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: WhichFoodColors.TEXT_COLOR, fontSize: 15.0),
                  controller: _f2PriceController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.FOOD_PRICE),
                      labelStyle: TextStyle(color: WhichFoodColors.PRIMARY_COLOR),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: WhichFoodColors.SECONDARY_COLOR))
                  )
              ),
            )
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Text(
          choose,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: WhichFoodColors.TEXT_COLOR,
              fontSize: 22.0
          ),
        )
      ],
    );
  }
}
