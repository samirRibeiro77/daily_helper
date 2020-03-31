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
          ],
        ),
        SizedBox(child: Container(height: 30.0)),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: <Widget>[
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
          ),
        )
      ],
    );
  }
}
