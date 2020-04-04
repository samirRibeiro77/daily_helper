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
  var _taxesController = TextEditingController();
  List<SplitBillsItem> _itemList = [];
  List<SplitBillsPeople> _peopleList = [];
  
  var _totalPrice = 0.0;

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
          _totalPrice += double.parse(item.value);
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
            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 5.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SplitBillsTextField(
                      label: AppLocalizations.of(context).translate(StringKey.TAXES),
                      controller: _taxesController,
                      function: (){},
                      isNumber: true,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SplitBillsTextField(
                      label: AppLocalizations.of(context).translate(StringKey.DISCOUNT),
                      controller: _discountController,
                      function: (){},
                      isNumber: true,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.TAXES)),
                    Text(_taxesController.text)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.DISCOUNT)),
                    Text(_discountController.text)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.TOTAL)),
                    Text(_totalPrice.toStringAsFixed(2))
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text(AppLocalizations.of(context).translate(StringKey.CLEAR_EXIT)),
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
