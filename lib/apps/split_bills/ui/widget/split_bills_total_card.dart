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
  
  var _totalMissing = 0.0;
  var _totalPaid = 0.0;
  var _taxes = 0.0;
  var _discount = 0.0;

  _SplitBillsTotalCardState(this._pageController);

  void _load() {
    _itemList = [];
    _peopleList = [];

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
          _getTotalPrice();
        });
      });
    });
  }

  void _changeDiscount() {
    _discount = 0.0;
    if (!_discountController.text.isEmpty) {
      _discount = double.parse(_discountController.text);
    }

    _peopleList.forEach((p) {
      p.discount = _discount;
    });

    setState(() {
      _getTotalPrice();
      _database.savePeople(_peopleList);
    });
  }

  void _changeTaxes() {
    _taxes = 0.0;
    if (!_taxesController.text.isEmpty) {
      _taxes = double.parse(_taxesController.text);
    }

    _peopleList.forEach((p) {
      p.taxes = _taxes;
    });

    setState(() {
      _getTotalPrice();
      _database.savePeople(_peopleList);
    });
  }

  void _getTotalPrice() {
    _totalMissing = 0.0;
    _itemList.forEach((i) {
      _totalMissing += double.parse(i.value);
    });
    _totalMissing = _totalMissing - ((_totalMissing * _discount) / 100) + ((_totalMissing * _taxes) / 100);
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
        onExpansionChanged: (val) {
          _load();
        },
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
                      function: _changeTaxes,
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
                      function: _changeDiscount,
                      isNumber: true,
                    ),
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: _peopleList.map((p) {
                return Row(
                  children: <Widget>[
                    Checkbox(
                      value: p.paid,
                      onChanged: (value){
                        setState(() {
                          p.paid = value;
                          if (value) {
                            _totalPaid += p.totalValue;
                            _totalMissing -= p.totalValue;
                          }
                          else {
                            _totalPaid -= p.totalValue;
                            _totalMissing += p.totalValue;
                          }
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text(p.name),
                    Expanded(child: SizedBox()),
                    Text(p.totalValue.toStringAsFixed(2))
                  ],
                );
              }).toList(),
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.TAXES)),
                    Text('${_taxesController.text}%')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.DISCOUNT)),
                    Text('${_discountController.text}%')
                  ],
                )
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.TOTAL_PAID)),
                    Text(_totalPaid.toStringAsFixed(2))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.TOTAL_MISSING)),
                    Text(_totalMissing.toStringAsFixed(2))
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
