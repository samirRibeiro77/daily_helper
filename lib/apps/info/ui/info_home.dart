import 'package:daily_helper/apps/info/ui/info_colors.dart';
import 'package:daily_helper/ui/widget/app_icon.dart';
import 'package:flutter/material.dart';

class InfoHome extends StatefulWidget {
  @override
  _InfoHomeState createState() => _InfoHomeState();
}

class _InfoHomeState extends State<InfoHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            AppIcon(
                Icons.person_outline,
                InfoColors.TEXT_COLOR
            ),
            Text(
              "Developer:",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.0,
                  color: InfoColors.TEXT_COLOR
              ),
            ),
            Text(
              "Samir de Jesus Ribeiro",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: InfoColors.TEXT_COLOR,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        SizedBox(child: Container(height: 30.0)),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: Text(
            "Version:\n1.0.0",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: InfoColors.TEXT_COLOR,
                fontSize: 15.0,
              )
          ),
        )
      ],
    );
  }
}
