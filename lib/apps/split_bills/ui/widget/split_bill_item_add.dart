import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SplitBillsAddItem extends StatefulWidget {
  @override
  _SplitBillsAddItemState createState() => _SplitBillsAddItemState();
}

class _SplitBillsAddItemState extends State<SplitBillsAddItem> {
  final _database = SplitBillsDatabase.instance;
  var _nameController = TextEditingController();
  var _valueController = TextEditingController();
  var _bill = SplitBillsBill.createNew();
  var _peopleToSplit = 0;

  void _load() async {
    _bill = SplitBillsBill.createNew();
    var existBill = await _database.existBill();

    if(existBill) {
      _database.readData().then((data) {
        setState(() {
          _bill = SplitBillsBill.fromJson(json.decode(data));
        });
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
  }

  bool _isTextMissing() {
    return _nameController.text.isEmpty && _valueController.text.isEmpty;
  }

  void _saveItem() {
    var itemBill = SplitBillsItem(
      _nameController.text,
      double.parse(_valueController.text),
      _peopleToSplit
    );

    _bill.items.add(itemBill);
    _database.save(_bill);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add item"),
        centerTitle: true,
        backgroundColor: SplitBillsColors.PRIMARY_COLOR
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            SplitBillsTextField(
              label: "Name",
              controller: _nameController,
            ),
            SplitBillsTextField(
              label: "Price",
              controller: _valueController,
              isNumber: true,
            ),
            SingleChildScrollView(
              child: Column(
                children: _bill.people.map((p) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: p.items.contains(_nameController.text),
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

                          print('Bill: ${_bill.toJson()}');
                        },
                      ),
                      SizedBox(width: 15.0),
                      Text(p.name)
                    ],
                  );
                }).toList(),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: _isTextMissing() ? null : _saveItem,
                    child: Text("Save"),
                    color: SplitBillsColors.PRIMARY_COLOR,
                    textColor: SplitBillsColors.BUTTON_TEXT_COLOR,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
