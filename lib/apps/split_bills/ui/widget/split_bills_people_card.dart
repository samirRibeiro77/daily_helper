import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SplitBillsPeopleCard extends StatefulWidget {
  @override
  _SplitBillsPeopleCardState createState() => _SplitBillsPeopleCardState();
}

class _SplitBillsPeopleCardState extends State<SplitBillsPeopleCard> {
  final _nameController = TextEditingController();
  final _database = SplitBillsDatabase.instance;
  var _bill = SplitBillsBill.createNew();

  void _addPeople() {
    if(_nameController.text.isNotEmpty) {
      _bill.addPerson(SplitBillsPerson(_nameController.text));
      _database.save(_bill);
      _nameController.text = "";
    }
  }

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
    _database.addListener(_load);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(AppLocalizations.of(context).translate(StringKey.PEOPLE)),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SplitBillsTextField(
                    label: AppLocalizations.of(context).translate(StringKey.NAME),
                    controller: _nameController
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: GestureDetector(
                    onTap: _addPeople,
                    child: Icon(Icons.add, color: SplitBillsColors.PRIMARY_COLOR),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _bill.people.map((p) {
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(p.name),
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}
