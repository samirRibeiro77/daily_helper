import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/ui/card/split_bills_item_card.dart';
import 'package:daily_helper/apps/split_bills/ui/card/split_bills_people_card.dart';
import 'package:daily_helper/apps/split_bills/ui/card/split_bills_total_card.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

class SplitBillsHome extends StatefulWidget {
  final PageController _pageController;

  SplitBillsHome(this._pageController);

  @override
  _SplitBillsHomeState createState() => _SplitBillsHomeState(_pageController);
}

class _SplitBillsHomeState extends State<SplitBillsHome> {
  final PageController _pageController;

  _SplitBillsHomeState(this._pageController);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
              child: Text(
                  AppLocalizations
                      .of(context)
                      .translate(StringKey.IDEA_BY)
                      .replaceAll('%s', 'Gabriela Almeida')
              )
          ),
        ),
        SplitBillsPeopleCard(),
        SizedBox(height: 20.0),
        SplitBillsItemCard(),
        SizedBox(height: 20.0),
        SplitBillsTotalCard(_pageController),
      ],
    );
  }
}
