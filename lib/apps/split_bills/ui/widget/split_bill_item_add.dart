import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_people.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_people_item.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SplitBillsAddItem extends StatefulWidget {
  Function _callback;

  SplitBillsAddItem(this._callback);

  @override
  _SplitBillsAddItemState createState() => _SplitBillsAddItemState(_callback);
}

class _SplitBillsAddItemState extends State<SplitBillsAddItem> {
  final _database = SplitBillsDatabase();
  var _peopleSplit = SplitBillsPeopleItem("", "", []);
  var _nameController = TextEditingController();
  var _valueController = TextEditingController();
  List<SplitBillsPeople> _peopleList = [];
  List<SplitBillsItem> _itemList = [];

  Function _callback;

  _SplitBillsAddItemState(this._callback);

  void _textChange() {
    _peopleSplit.name = _nameController.text;
    _peopleSplit.value = _valueController.text;
  }

  bool _isTextMissing() {
    return _nameController.text.isEmpty && _valueController.text.isEmpty;
  }

  void _saveItem() {
    _peopleSplit.save().forEach((pb) {
      _peopleList.where(
              (p) => p.name == pb.name
      ).first.value += pb.value;
    });

    var itemBill = SplitBillsItem(_peopleSplit.name, _peopleSplit.value);
    _itemList.add(itemBill);

    _database.saveItems(_itemList);
    _database.savePeople(_peopleList);

    _callback();
    Navigator.of(context).pop();
  }

  void _load() {
    _peopleList = [];
    _itemList = [];

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
              function: _textChange,
            ),
            SplitBillsTextField(
              label: "Price",
              controller: _valueController,
              function: _textChange,
              isNumber: true,
            ),
            SingleChildScrollView(
              child: Column(
                children: _peopleList.map((p) {
                  return Row(
                    children: <Widget>[
                      Checkbox(
                        value: _peopleSplit.people != null
                            ? _peopleSplit.people.contains(p.name)
                            : false,
                        onChanged: (value){
                          setState(() {
                            if (_peopleSplit.people == null) {
                              _peopleSplit.people = [];
                            }

                            if(value) {
                              _peopleSplit.people.add(p.name);
                            }
                            else {
                              _peopleSplit.people.remove(p.name);
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
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    onPressed: _saveItem,
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
