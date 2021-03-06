import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
import 'package:daily_helper/apps/which_fuel/ui/widget/which_fuel_textfield.dart';
import 'package:daily_helper/ui/widget/app_icon.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import '../../../app_localizations.dart';
import '../core/which_fuel_answer.dart';

class WhichFuelHome extends StatefulWidget {
  @override
  _WhichFuelHomeState createState() => _WhichFuelHomeState();
}

class _WhichFuelHomeState extends State<WhichFuelHome> {
  final _alcoholController = TextEditingController();
  final _gasolineController = TextEditingController();
  var choose = "";

  void _valuesChange() {
    setState(() {
      choose = _checkFuel();
    });
  }

  String _checkFuel() {
    if (_alcoholController.value.text.isEmpty | _gasolineController.value.text.isEmpty) {
      return "";
    }

    var alcoholValue = double.parse(_alcoholController.value.text.replaceAll(',', '.'));
    var gasolineValue = double.parse(_gasolineController.value.text.replaceAll(',', '.'));

    var answer = WhichFuelAnswer(alcoholValue, gasolineValue);
    return "${AppLocalizations.of(context).translate(StringKey.CHOOSE)} ${answer.result(context)}";
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        AppIcon(
            Icons.local_gas_station,
            WhichFuelColors.PRIMARY_COLOR
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.ALCOHOL),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WhichFuelColors.TEXT_COLOR),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: Text(
                AppLocalizations.of(context).translate(StringKey.GASOLINE),
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: WhichFuelColors.TEXT_COLOR),
              ),
            ),
            SizedBox(child: Container(width: 20.0))
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            WhichFuelTextField(
              label: AppLocalizations.of(context).translate(StringKey.PRICE),
              controller: _alcoholController,
              function: _valuesChange,
            ),
            SizedBox(child: Container(width: 20.0)),
            WhichFuelTextField(
              label: AppLocalizations.of(context).translate(StringKey.PRICE),
              controller: _gasolineController,
              function: _valuesChange,
            )
          ],
        ),
        SizedBox(child: Container(height: 20.0)),
        Text(
          choose,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: WhichFuelColors.TEXT_COLOR,
            fontSize: 22.0
          ),
        )
      ],
    );
  }
}
