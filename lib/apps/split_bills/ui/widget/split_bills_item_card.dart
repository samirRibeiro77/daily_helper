import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_item_add.dart';
import 'package:flutter/material.dart';

class SplitBillsItemCard extends StatefulWidget {
  @override
  _SplitBillsItemCardState createState() => _SplitBillsItemCardState();
}

class _SplitBillsItemCardState extends State<SplitBillsItemCard> {
  final _database = SplitBillsDatabase();

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ExpansionTile(
          title: Text("Items"),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
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
                                    builder: (context) => SplitBillsAddItem()
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
            )
          ],
        )
    );
  }
}
