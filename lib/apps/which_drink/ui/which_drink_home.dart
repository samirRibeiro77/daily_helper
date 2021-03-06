import 'package:daily_helper/apps/which_drink/core/which_drink_answer.dart';
import 'package:daily_helper/apps/which_drink/ui/which_drink_colors.dart';
import 'package:daily_helper/apps/which_drink/ui/widget/which_drink_textfield.dart';
import 'package:daily_helper/ui/widget/app_icon.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';

class WhichDrinkHome extends StatefulWidget {
  @override
  _WhichDrinkHomeState createState() => _WhichDrinkHomeState();
}

class _WhichDrinkHomeState extends State<WhichDrinkHome> {
  final _d1MeasureController = TextEditingController();
  final _d1PriceController = TextEditingController();
  final _d2MeasureController = TextEditingController();
  final _d2PriceController = TextEditingController();
  String choose = "";

  void _valuesChange() {
    setState(() {
      choose = _checkDrink();
    });
  }

  String _checkDrink() {
    if(_d1MeasureController.text.isEmpty
    |_d1PriceController.text.isEmpty
    |_d2MeasureController.text.isEmpty
    |_d2PriceController.text.isEmpty) {
      return "";
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

    return "${AppLocalizations.of(context).translate(StringKey.CHOOSE)} ${answer.result(context)}";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        AppIcon(
            Icons.local_drink,
            WhichDrinkColors.PRIMARY_COLOR
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.DRINK_1),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WhichDrinkColors.TEXT_COLOR),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.DRINK_2),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WhichDrinkColors.TEXT_COLOR),
              ),
            ),
            SizedBox(child: Container(width: 20.0))
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            WhichFoodTextField(
              label: AppLocalizations.of(context).translate(StringKey.DRINK_MEASURE),
              controller: _d1MeasureController,
              function: _valuesChange,
            ),
            SizedBox(child: Container(width: 20.0)),
            WhichFoodTextField(
              label: AppLocalizations.of(context).translate(StringKey.DRINK_MEASURE),
              controller: _d2MeasureController,
              function: _valuesChange,
            ),
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            WhichFoodTextField(
              label: AppLocalizations.of(context).translate(StringKey.PRICE),
              controller: _d1PriceController,
              function: _valuesChange,
            ),
            SizedBox(child: Container(width: 20.0)),
            WhichFoodTextField(
              label: AppLocalizations.of(context).translate(StringKey.PRICE),
              controller: _d2PriceController,
              function: _valuesChange,
            ),
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Text(
          choose,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: WhichDrinkColors.TEXT_COLOR,
            fontSize: 22.0
          ),
        )
      ],
    );
  }
}
