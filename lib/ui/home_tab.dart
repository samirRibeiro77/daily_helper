import 'package:daily_helper/ui/widget/app_icon.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        AppIcon(
            Icons.person_outline,
            Colors.white
        ),
        Text(
          "Developer:",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12.0,
            color: Colors.white
          ),
        ),
        Text(
          "Samir de Jesus Ribeiro",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 20.0,
          ),
        ),
        SizedBox(child: Container(height: 30.0)),
        SelectableText(
            "+55 (31) 98605-5571",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            )
        ),
        SelectableText(
            "samir.sjr77@gmail.com",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            )
        )
      ],
    );
  }
}
