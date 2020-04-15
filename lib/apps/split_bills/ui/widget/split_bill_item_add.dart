import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SplitBillsAddItem extends StatefulWidget {
  final String editing;

  SplitBillsAddItem({this.editing = ""});

  @override
  _SplitBillsAddItemState createState() => _SplitBillsAddItemState(editing);
}

class _SplitBillsAddItemState extends State<SplitBillsAddItem> {
  var _nameController = TextEditingController();
  var _valueController = TextEditingController();
  var _peopleToSplit = 0;

  final String _editing;

  _SplitBillsAddItemState(this._editing);

  void _loadEdit(SplitBillModel model) {
    if(_editing.isNotEmpty) {
      var item = model.bill.items.firstWhere((i) => i.name == _editing);
      _nameController.text = item.name;
      _valueController.text = item.value.toStringAsFixed(2);
    }
  }

  bool _canSave() {
    return _nameController.text.isNotEmpty
        && _valueController.text.isNotEmpty
        && _peopleToSplit > 0;
  }

  void _saveItem(SplitBillModel model) {
    var itemBill = SplitBillsItem(
        _nameController.text,
        double.parse(_valueController.text.replaceAll(',', '.')),
        _peopleToSplit
      );

    var search = model.bill.items.where((i) => i.name == itemBill.name);
    if(search.isNotEmpty) {
      itemBill.peopleToSplit += search.first.peopleToSplit;
      model.bill.items.remove(search.first);
    }

    model.addItem(itemBill);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate(StringKey.ADD_EDIT_ITEM)),
        centerTitle: true,
        backgroundColor: SplitBillsColors.PRIMARY_COLOR
      ),
      body: ScopedModelDescendant<SplitBillModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            _loadEdit(model);
            return ListView(
              padding: EdgeInsets.all(10.0),
              children: [
                SplitBillsTextField(
                  label: AppLocalizations.of(context).translate(StringKey.NAME),
                  controller: _nameController,
                ),
                SplitBillsTextField(
                  label: AppLocalizations.of(context).translate(StringKey.PRICE),
                  controller: _valueController,
                  isNumber: true,
                ),
                Column(
                  children: model.bill.people.map((p) {
                    return Row(
                      children: <Widget>[
                        Checkbox(
                          value: p.items.contains(_nameController.text),
                          activeColor: SplitBillsColors.PRIMARY_COLOR,
                          onChanged: (value){
                            setState(() {
                              if(value) {
                                p.items.add(_nameController.text);
                                _peopleToSplit++;
                              }
                              else {
                                p.items.remove(_nameController.text);
                                _peopleToSplit--;
                              }
                            });
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
                        onPressed: _canSave()
                            ? (){_saveItem(model);}
                            : null,
                        child: Text(AppLocalizations.of(context).translate(StringKey.SAVE)),
                        color: SplitBillsColors.PRIMARY_COLOR,
                        textColor: SplitBillsColors.BUTTON_TEXT_COLOR,
                      ),
                    )
                  ],
                )
              ],
            );
          }
      )
    );
  }
}
