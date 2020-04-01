import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

class SplitBillsTotalCard extends StatefulWidget {
  final PageController _pageController;

  SplitBillsTotalCard(this._pageController);

  @override
  _SplitBillsTotalCardState createState() => _SplitBillsTotalCardState(_pageController);
}

class _SplitBillsTotalCardState extends State<SplitBillsTotalCard> {
  final PageController _pageController;
  var _database = SplitBillsDatabase();

  _SplitBillsTotalCardState(this._pageController);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(AppLocalizations.of(context).translate(StringKey.TOTAL)),
        children: <Widget>[
          RaisedButton(
            child: Text("Clear and exit"),
            color: SplitBillsColors.PRIMARY_COLOR,
            textColor: Colors.white,
            onPressed: () {
              _database.clearDatabase();
              _pageController.jumpToPage(0);
            },
          )
        ],
      ),
    );
  }
}
