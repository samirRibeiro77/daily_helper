import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_popup_menu.dart';
import 'package:flutter/material.dart';

class PersonTile extends StatelessWidget {
  final SplitBillsPerson person;

  PersonTile(this.person);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(person.name),
          SplitBillPopupMenu(person: person),
        ],
      ),
    );
  }
}
