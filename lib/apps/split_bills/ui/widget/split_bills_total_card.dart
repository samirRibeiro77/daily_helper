import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_people.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SplitBillsTotalCard extends StatefulWidget {
  final PageController _pageController;

  SplitBillsTotalCard(this._pageController);

  @override
  _SplitBillsTotalCardState createState() => _SplitBillsTotalCardState(_pageController);
}

class _SplitBillsTotalCardState extends State<SplitBillsTotalCard> {
  final PageController _pageController;
  final _database = SplitBillsDatabase();
  var _discountController = TextEditingController();
  List<SplitBillsItem> _itemList = [];
  List<SplitBillsPeople> _peopleList = [];

  _SplitBillsTotalCardState(this._pageController);

  void _load() {
    _database.readData(SplitBillsDatabase.PEOPLE_FILE).then((data) {
      List mapJson = json.decode(data);
      mapJson.forEach((jsonData) {
        var people = SplitBillsPeople.fromJson(jsonData);
        setState(() {
          _peopleList.add(people);
        });
      });
    });

    _database.readData(SplitBillsDatabase.ITEMS_FILE).then((data) {
      List mapJson = json.decode(data);
      mapJson.forEach((jsonData) {
        var item = SplitBillsItem.fromJson(jsonData);
        setState(() {
          _itemList.add(item);
        });
      });
    });
  }


  @override
  void initState() {
    super.initState();
    _load();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(AppLocalizations.of(context).translate(StringKey.TOTAL)),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SplitBillsTextField(
                  label: AppLocalizations.of(context).translate(StringKey.NAME),
                  controller: _discountController,
                  function: (){},
                  isNumber: true,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("Clear and exit"),
                    color: SplitBillsColors.PRIMARY_COLOR,
                    textColor: Colors.white,
                    onPressed: () {
                      _database.clearDatabase();
                      _pageController.jumpToPage(0);
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
