import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

class SplitBillsAddItem extends StatefulWidget {
  final int id;

  SplitBillsAddItem({this.id});

  @override
  _SplitBillsAddItemState createState() => _SplitBillsAddItemState(id);
}

class _SplitBillsAddItemState extends State<SplitBillsAddItem> {
  var _nameController = TextEditingController();
  var _valueController = TextEditingController();
  List<int> _peopleToSplit = [];
  var _canSave = false;

  final int _itemId;
  var _run = true;

  _SplitBillsAddItemState(this._itemId);

  void _loadEdit(SplitBillsBill bill) {
    if(_itemId != null && _run) {
      var item = bill.items.firstWhere((i) => i.id == _itemId);
      _nameController.text = item.name;
      _valueController.text = item.value.toStringAsFixed(2);
      _peopleToSplit = item.people;
      _run = false;
    }
  }

  void _checkCanSave() {
    setState(() {
      _canSave = _nameController.text.isNotEmpty
          && _valueController.text.isNotEmpty
          && _peopleToSplit.length > 0;
    });
  }

  void _saveItem(BuildContext context) {
    var _id = _itemId != null ? _itemId : null;
    var item = SplitBillsItem(
        id: _id,
        name: _nameController.text,
        value: double.parse(_valueController.text.replaceAll(',', '.')),
        people: _peopleToSplit
    );

    SplitBillModel.of(context).addUpdateItem(item);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    var bill = SplitBillModel.of(context).bill;
    _loadEdit(bill);

    return Theme(
      data: ThemeData(
        primarySwatch: SplitBillsColors.PRIMARY_COLOR
      ),
      child: Scaffold(
          appBar: AppBar(
              title: Text(AppLocalizations.of(context).translate(StringKey.ADD_EDIT_ITEM)),
              centerTitle: true
          ),
          body: ListView(
            padding: EdgeInsets.all(10.0),
            children: [
              Row(
                children: [
                  SplitBillsTextField(
                    label: AppLocalizations.of(context).translate(StringKey.NAME),
                    controller: _nameController,
                    onChangeFunction: _checkCanSave,
                  )
                ],
              ),
              Row(
                children: [
                  SplitBillsTextField(
                    label: AppLocalizations.of(context).translate(StringKey.PRICE),
                    controller: _valueController,
                    isNumber: true,
                    onChangeFunction: _checkCanSave,
                  )
                ],
              ),
              Column(
                children: bill.people.map((p) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: p.paid ? true : _peopleToSplit.contains(p.id),
                        activeColor: p.paid ? Colors.grey : SplitBillsColors.PRIMARY_COLOR,
                        onChanged: (value){
                          setState(() {
                            if (p.paid) {
                              return;
                            }

                            if(value) {
                              _peopleToSplit.add(p.id);
                            }
                            else {
                              _peopleToSplit.remove(p.id);
                            }
                          });

                          _checkCanSave();
                        },
                      ),
                      SizedBox(width: 15.0),
                      Text(p.name)
                    ],
                  );
                }).toList(),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: _canSave
                          ? (){_saveItem(context);}
                          : null,
                      child: Text(AppLocalizations.of(context).translate(StringKey.SAVE)),
                      color: SplitBillsColors.PRIMARY_COLOR,
                      textColor: SplitBillsColors.BUTTON_TEXT_COLOR,
                    ),
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
