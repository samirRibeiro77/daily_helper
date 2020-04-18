import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_item_add.dart';
import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  final SplitBillsItem item;

  ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        children: <Widget>[
          Text(item.name),
          Expanded(child: SizedBox()),
          Text(item.value.toStringAsFixed(2)),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplitBillsAddItem(id: item.id)
                    )
                );
              },
              child: Icon(Icons.more_vert, color: Colors.grey[600]),
            ),
          ),
        ],
      ),
    );
  }
}
