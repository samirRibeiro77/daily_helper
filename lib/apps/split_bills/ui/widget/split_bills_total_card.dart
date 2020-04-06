import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
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
  final _database = SplitBillsDatabase.instance;
  var _discountController = TextEditingController();
  var _taxesController = TextEditingController();
  var _bill = SplitBillsBill.createNew();
  
  var _totalMissing = 0.0;
  var _totalPaid = 0.0;

  _SplitBillsTotalCardState(this._pageController);

  void _changeDiscount() {
    var _discount = 0.0;
    if (!_discountController.text.isEmpty) {
      _discount = double.parse(_discountController.text);
    }

    _bill.discount = _discount/100;
    _database.save(_bill);

    _getTotalPrice();
  }

  void _changeTaxes() {
    var _taxes = 0.0;
    if (!_taxesController.text.isEmpty) {
      _taxes = double.parse(_taxesController.text);
    }

    _bill.taxes = _taxes/100;
    _database.save(_bill);

    _getTotalPrice();
  }

  void _getTotalPrice() {
    _totalMissing = 0.0;
    _bill.items.forEach((i) {
      _totalMissing += i.value;
    });
    setState(() {
      _totalMissing = _totalMissing - (_totalMissing * _bill.discount) + (_totalMissing * _bill.taxes);
    });
  }

  void _load() async {
    _bill = SplitBillsBill.createNew();
    var existBill = await _database.existBill();

    if(existBill) {
      _database.readData().then((data) {
        setState(() {
          _bill = SplitBillsBill.fromJson(json.decode(data));
        });
        _getTotalPrice();
      });
    }
    else {
      setState(() {
        _bill = SplitBillsBill.createNew();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _load();
    _database.addListener(_load);
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
              children: _bill.people.map((p) {
                var total = p.totalPrice(
                    discount: _bill.discount,
                    taxes: _bill.taxes,
                    listItem: _bill.items
                );

                print('Person ${p.name} // Total to pay: $total');

                return Row(
                  children: <Widget>[
                    Checkbox(
                      value: p.paid,
                      onChanged: (value){
                        setState(() {
                          p.paid = value;
                          if (value) {
                            _totalPaid += total;
                            _totalMissing -= total;
                          }
                          else {
                            _totalPaid -= total;
                            _totalMissing += total;
                          }
                        });
                      },
                    ),
                    SizedBox(width: 10.0),
                    Text(p.name),
                    Expanded(child: SizedBox()),
                    Text(total.toStringAsFixed(2))
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
                    Text('${(_bill.taxes * 100).toStringAsFixed(2)}%')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(AppLocalizations.of(context).translate(StringKey.DISCOUNT)),
                    Text('${(_bill.discount * 100).toStringAsFixed(2)}%')
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
