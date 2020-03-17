import 'package:daily_helper/apps/which_fuel/ui/which_fuel_colors.dart';
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
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Container(
            height: 200.0,
            child: Image.asset('assets/images/which_fuel_icon.png'),
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(
              child: TextField(
                style: TextStyle(color: WhichFuelColors.TEXT_COLOR, fontSize: 15.0),
                controller: _alcoholController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.ALCOHOL),
                    labelStyle: TextStyle(color: WhichFuelColors.PRIMARY_COLOR),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: WhichFuelColors.PRIMARY_COLOR)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: WhichFuelColors.PRIMARY_COLOR))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: WhichFuelColors.TEXT_COLOR, fontSize: 15.0),
                  controller: _gasolineController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.GASOLINE),
                      labelStyle: TextStyle(color: WhichFuelColors.PRIMARY_COLOR),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: WhichFuelColors.PRIMARY_COLOR)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: WhichFuelColors.PRIMARY_COLOR))
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
            color: WhichFuelColors.TEXT_COLOR,
            fontSize: 22.0
          ),
        )
      ],
    );
  }
}
