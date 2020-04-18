import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:flutter/material.dart';

class PersonPriceTile extends StatefulWidget {
  final SplitBillsPerson person;
  final SplitBillsBill bill;

  PersonPriceTile({
    @required this.person,
    @required this.bill
  });

  @override
  _PersonPriceTileState createState() => _PersonPriceTileState(person, bill);
}

class _PersonPriceTileState extends State<PersonPriceTile> {
  final SplitBillsPerson person;
  final SplitBillsBill bill;


  _PersonPriceTileState(this.person, this.bill);

  @override
  Widget build(BuildContext context) {
    var total = bill.getTotalPerson(person.id);

    return Row(
      children: <Widget>[
        Checkbox(
          value: person.paid,
          onChanged: (value){
            SplitBillModel.of(context).peoplePaid(person.id, value);
          },
        ),
        SizedBox(width: 10.0),
        Text(person.name),
        Expanded(child: SizedBox()),
        Text(total.toStringAsFixed(2))
      ],
    );
  }
}
