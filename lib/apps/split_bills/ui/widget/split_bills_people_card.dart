import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_people.dart';
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
  final _database = SplitBillsDatabase();
  List<SplitBillsPeople> _peopleList = [];

  void _addPeople() {
    setState(() {
      _peopleList.add(SplitBillsPeople(_nameController.text));
      _database.savePeople(_peopleList);
      _nameController.text = "";
    });
  }

  @override
  void initState() {
    super.initState();

    _database.readData(SplitBillsDatabase.PEOPLE_FILE).then((data) {
      List mapJson = json.decode(data);
      mapJson.forEach((jsonData) {
        print(jsonData);
        var people = SplitBillsPeople.fromJson(jsonData);
        setState(() {
          _peopleList.add(people);
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(AppLocalizations.of(context).translate(StringKey.PEOPLE)),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SplitBillsTextField(
                    label: AppLocalizations.of(context).translate(StringKey.NAME),
                    controller: _nameController
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
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
              children: _peopleList.map((p) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(p.name),
                    Text(p.value.toStringAsFixed(2))
                  ],
                );
              }).toList(),
            ),
          )
        ],
      )
    );
  }
}
