import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_popup_menu.dart';
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
          SplitBillPopupMenu(item: item),
        ],
      ),
    );
  }
}
