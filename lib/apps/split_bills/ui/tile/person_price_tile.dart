import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:flutter/material.dart';

class PersonPriceTile extends StatefulWidget {
  final SplitBillsPerson person;
  final List<SplitBillsItem> items;

  PersonPriceTile({
    @required this.person,
    @required this.items
  });

  @override
  _PersonPriceTileState createState() => _PersonPriceTileState(person, items);
}

class _PersonPriceTileState extends State<PersonPriceTile> {
  final SplitBillsPerson person;
  final List<SplitBillsItem> items;

  _PersonPriceTileState(this.person, this.items);

  @override
  Widget build(BuildContext context) {
    var total = 0.0;
    items.where((i) => i.people.contains(person.id)).forEach((i) {
      total += i.value;
    });

    return Row(
      children: <Widget>[
        Checkbox(
          value: person.paid,
          onChanged: (value){
            setState(() {
              person.paid = value;
            });
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


/*class PersonPriceTile extends StatelessWidget {
  final SplitBillsPerson person;
  final List<SplitBillsItem> items;

  PersonPriceTile({
    @required this.person,
    @required this.items
  });

  @override
  Widget build(BuildContext context) {
    return
  }
}*/
