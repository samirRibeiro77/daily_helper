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
  final _whichFuelController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void _valuesChange() {
      if (_alcoholController.value.text.isEmpty | _gasolineController.value.text.isEmpty) {
        _whichFuelController.text = "";
        return;
      }

      var alcoholValue = double.parse(_alcoholController.value.text.replaceAll(',', '.'));
      var gasolineValue = double.parse(_gasolineController.value.text.replaceAll(',', '.'));

      var answer = WhichFuelAnswer(alcoholValue, gasolineValue);
      _whichFuelController.text = answer.result(context);
    }

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
                style: TextStyle(color: Colors.white, fontSize: 15.0),
                controller: _alcoholController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.ALCOHOL),
                    labelStyle: TextStyle(color: Colors.white),
                    focusedBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    enabledBorder:
                    OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                ),
              ),
            ),
            SizedBox(child: Container(width: 20.0)),
            Flexible(
              child: TextField(
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  controller: _gasolineController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.GASOLINE),
                      labelStyle: TextStyle(color: Colors.white),
                      focusedBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      enabledBorder:
                      OutlineInputBorder(borderSide: BorderSide(color: Colors.white))
                  )
              ),
            )
          ],
        ),
        TextField(
          enabled: false,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 20.0),
          controller: _whichFuelController,
        )
      ],
    );
  }
}
