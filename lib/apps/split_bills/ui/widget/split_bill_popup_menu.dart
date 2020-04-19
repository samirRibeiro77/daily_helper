import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bill_item_add.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';

class SplitBillPopupMenu extends StatelessWidget {
  final SplitBillsItem item;
  final SplitBillsPerson person;

  SplitBillPopupMenu({this.item, this.person});

  @override
  Widget build(BuildContext context) {
    void _edit() {
      if (person != null) {
        var _nameController = TextEditingController();
        _nameController.text = person.name;

        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context).translate(StringKey.PEOPLE)),
              content: SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Row(
                      children: [
                        SplitBillsTextField(
                          label: AppLocalizations.of(context).translate(StringKey.NAME),
                          controller: _nameController,
                        )
                      ],
                    )
                  ],
                ),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(AppLocalizations.of(context).translate(StringKey.CANCEL)),
                  textColor: Colors.red,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text(AppLocalizations.of(context).translate(StringKey.SAVE)),
                  textColor: Colors.green,
                  onPressed: () {
                    person.name = _nameController.text;
                    SplitBillModel.of(context).addUpdatePerson(person);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }

      if (item != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SplitBillsAddItem(id: item.id)
            )
        );
      }
    }

    void _remove() {
      var model = SplitBillModel.of(context);
      if (person != null) {
        model.removePerson(person.id);
      }
      if (item != null) {
        model.removeItem(item.id);
      }
    }

    final List<Choice> _choices = [
      Choice(
          title: AppLocalizations.of(context).translate(StringKey.EDIT),
          function: _edit,
          color: Colors.black
      ),
      Choice(
          title: AppLocalizations.of(context).translate(StringKey.REMOVE),
          function: _remove,
          color: Colors.red[700]
      ),
    ];

    return PopupMenuButton<Choice>(
      onSelected: (c){
        c.function();
      },
      itemBuilder: (BuildContext context) {
        return _choices.map((c) {
          return PopupMenuItem<Choice>(
            value: c,
            child: Text(c.title, style: TextStyle(color: c.color)),
          );
        }).toList();
      },
    );
  }
}

class Choice{
  final String title;
  final Function function;
  final Color color;

  Choice({
    this.title,
    this.function,
    this.color
  });
}
