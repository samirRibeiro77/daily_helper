import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_item_add.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SplitBillsItemCard extends StatefulWidget {
  @override
  _SplitBillsItemCardState createState() => _SplitBillsItemCardState();
}

class _SplitBillsItemCardState extends State<SplitBillsItemCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ScopedModelDescendant<SplitBillModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return ExpansionTile(
              title: Text(AppLocalizations.of(context).translate(StringKey.ITEMS)),
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
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    children: model.bill.items.map((i) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(i.name),
                            Expanded(child: SizedBox()),
                            Text(i.value.toStringAsFixed(2)),
                            Padding(
                              padding: EdgeInsets.only(left: 10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SplitBillsAddItem(editing: i.name)
                                      )
                                  );
                                },
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
            );
          },
        )
    );
  }
}
