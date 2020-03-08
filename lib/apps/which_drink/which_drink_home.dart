import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

import '../../app_localizations.dart';

class WhichDrinkHome extends StatefulWidget {
  @override
  _WhichDrinkHomeState createState() => _WhichDrinkHomeState();
}

class _WhichDrinkHomeState extends State<WhichDrinkHome> {
  @override
  Widget build(BuildContext context) {
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
            Flexible(
              child: TextField(
                style: TextStyle(color: Colors.black, fontSize: 15.0),
                //controller: _alcoholController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.ALCOHOL),
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
                  //controller: _gasolineController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  //onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.GASOLINE),
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
                //controller: _alcoholController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                //onChanged: (value){ _valuesChange(); },
                decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).translate(StringKey.ALCOHOL),
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
                  //controller: _gasolineController,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  //onChanged: (value){ _valuesChange(); },
                  decoration: InputDecoration(
                      labelText: AppLocalizations.of(context).translate(StringKey.GASOLINE),
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
          //controller: _whichFuelController,
        )
      ],
    );
  }
}
