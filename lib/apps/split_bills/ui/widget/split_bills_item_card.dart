import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_item_add.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class SplitBillsItemCard extends StatefulWidget {
  @override
  _SplitBillsItemCardState createState() => _SplitBillsItemCardState();
}

class _SplitBillsItemCardState extends State<SplitBillsItemCard> {
  final _database = SplitBillsDatabase();
  List<SplitBillsItem> _itemList = [];

  void _load() {
    _itemList = [];
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
    return Card(
        child: ExpansionTile(
          onExpansionChanged: (val) {
            _load();
          },
          title: Text("Items"),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(width: 20.0),
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SplitBillsAddItem(_load)
                                )
                            );
                          },
                          child: Icon(Icons.add, color: SplitBillsColors.PRIMARY_COLOR),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: _itemList.map((p) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Row(
                      children: <Widget>[
                        Text(p.name),
                        Expanded(child: SizedBox()),
                        Text(p.value),
                        Padding(
                          padding: EdgeInsets.only(left: 10.0),
                          child: GestureDetector(
                            onTap: (){},
                            child: Icon(Icons.more_vert),
                          ),
                        )
                      ],
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        )
    );
  }
}
