import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SplitBillsTotalCard extends StatefulWidget {
  final PageController _pageController;

  SplitBillsTotalCard(this._pageController);

  @override
  _SplitBillsTotalCardState createState() => _SplitBillsTotalCardState(_pageController);
}

class _SplitBillsTotalCardState extends State<SplitBillsTotalCard> {
  final PageController _pageController;
  var _discountController = TextEditingController();
  var _taxesController = TextEditingController();
  
  var _totalMissing = 0.0;
  var _totalPaid = 0.0;

  _SplitBillsTotalCardState(this._pageController);

  void _changeDiscount(SplitBillModel model) {
    var _discount = 0.0;
    if (_discountController.text.isNotEmpty) {
      _discount = double.parse(_discountController.text);
    }
    model.applyDiscount(_discount);
  }

  void _changeTaxes(SplitBillModel model) {
    var _taxes = 0.0;
    if (_taxesController.text.isNotEmpty) {
      _taxes = double.parse(_taxesController.text);
    }
    model.applyTaxes(_taxes);
  }

  void _getTotalPrice(SplitBillModel model) {
    _totalMissing = 0.0;
    _totalPaid = 0.0;

    model.bill.items.forEach((i) {
      _totalMissing += i.value;
    });

    model.bill.people.forEach((p) {
      var total = p.totalPrice(
          discount: model.bill.discount,
          taxes: model.bill.taxes,
          listItem: model.bill.items
      );

      _totalPaid = p.paid ? _totalPaid + total : _totalPaid;
    });

    _totalMissing = (_totalMissing - (_totalMissing * model.bill.discount) + (_totalMissing * model.bill.taxes)) - _totalPaid;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ScopedModelDescendant<SplitBillModel>(
        builder: (context, child, model) {
          if (model.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          _getTotalPrice(model);
          return ExpansionTile(
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
                          onChangeFunction: () {
                            _changeTaxes(model);
                          },
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
                          onChangeFunction: () {
                            _changeDiscount(model);
                          },
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
                  children: model.bill.people.map((p) {
                    var total = p.totalPrice(
                        discount: model.bill.discount,
                        taxes: model.bill.taxes,
                        listItem: model.bill.items
                    );

                    return Row(
                      children: <Widget>[
                        Checkbox(
                          value: p.paid,
                          onChanged: (value){
                            setState(() {
                              p.paid = value;
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
                        Text('${(model.bill.taxes * 100).toStringAsFixed(2)}%')
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(AppLocalizations.of(context).translate(StringKey.DISCOUNT)),
                        Text('${(model.bill.discount * 100).toStringAsFixed(2)}%')
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
                          model.clearDatabase();
                          _pageController.jumpToPage(0);
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      )
    );
  }
}
