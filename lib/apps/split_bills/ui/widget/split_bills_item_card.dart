import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:flutter/material.dart';

class SplitBillsItemCard extends StatefulWidget {
  @override
  _SplitBillsItemCardState createState() => _SplitBillsItemCardState();
}

class _SplitBillsItemCardState extends State<SplitBillsItemCard> {
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
                          onTap: (){},
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
