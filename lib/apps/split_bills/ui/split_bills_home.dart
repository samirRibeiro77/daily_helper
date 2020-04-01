import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_item_card.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_people_card.dart';
import 'package:flutter/material.dart';

class SplitBillsHome extends StatefulWidget {
  @override
  _SplitBillsHomeState createState() => _SplitBillsHomeState();
}

class _SplitBillsHomeState extends State<SplitBillsHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        SplitBillsPeopleCard(),
        SizedBox(height: 20.0),
        SplitBillsItemCard(),
        SizedBox(height: 20.0),
        ExpansionTile(
          title: Text("Bill total"),
          children: <Widget>[
            Card()
          ],
        ),
      ],
    );
  }
}
