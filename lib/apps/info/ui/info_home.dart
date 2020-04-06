import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/info/ui/info_colors.dart';
import 'package:daily_helper/ui/widget/app_icon.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class InfoHome extends StatefulWidget {
  @override
  _InfoHomeState createState() => _InfoHomeState();
}

class _InfoHomeState extends State<InfoHome> {
  final _mail = 'samir.sjr77@gmail.com',
      _subject = 'Daily%20Helper:%20Contact';

  void _sendMail() async {
    var url = 'mailto:$_mail?subject=$_subject';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
          padding: EdgeInsets.only(bottom: 30.0),
          child: GestureDetector(
            onTap: _sendMail,
            child: Text(
              AppLocalizations.of(context).translate(StringKey.CONTACT_US),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0,
                  color: InfoColors.TEXT_COLOR
              ),
            ),
          ),
        )
      ],
    );
  }
}
