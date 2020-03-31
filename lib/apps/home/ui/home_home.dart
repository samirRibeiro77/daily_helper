import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class HomeHome extends StatefulWidget {
  @override
  _HomeHomeState createState() => _HomeHomeState();
}

class _HomeHomeState extends State<HomeHome> {
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
        Padding(
          padding: EdgeInsets.only(top: 40.0),
          child: Text(
            AppLocalizations.of(context).translate(StringKey.APP_NAME),
            textAlign: TextAlign.center,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 100.0,
                color: Colors.white
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 40.0),
          child: GestureDetector(
            onTap: _sendMail,
            child: Text(
              AppLocalizations.of(context).translate(StringKey.CONTACT_US),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0,
                  color: Colors.white
              ),
            ),
          ),
        ),
      ],
    );
  }
}
