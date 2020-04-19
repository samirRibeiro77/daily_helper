import 'package:daily_helper/app_localizations.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:daily_helper/apps/split_bills/model/SplitBillModel.dart';
import 'package:daily_helper/apps/split_bills/ui/split_bills_color.dart';
import 'package:daily_helper/apps/split_bills/ui/tile/person_tile.dart';
import 'package:daily_helper/apps/split_bills/ui/widget/split_bills_textfield.dart';
import 'package:daily_helper/util/string_key.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class SplitBillsPeopleCard extends StatefulWidget {
  @override
  _SplitBillsPeopleCardState createState() => _SplitBillsPeopleCardState();
}

class _SplitBillsPeopleCardState extends State<SplitBillsPeopleCard> {
  final _nameController = TextEditingController();

  void _addPeople(SplitBillModel model) {
    if(_nameController.text.isNotEmpty) {
      model.addUpdatePerson(SplitBillsPerson(name: _nameController.text));
      _nameController.clear();
    }
  }


  @override
  void dispose() {
    super.dispose();
    _nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ScopedModelDescendant<SplitBillModel>(
          builder: (context, child, model) {
            if (model.isLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return ExpansionTile(
              title: Text(AppLocalizations.of(context).translate(StringKey.PEOPLE)),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SplitBillsTextField(
                        label: AppLocalizations.of(context).translate(StringKey.NAME),
                        controller: _nameController,
                        onSubmitFunction: () {
                          _addPeople(model);
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: GestureDetector(
                          onTap: (){
                            _addPeople(model);
                          },
                          child: Icon(Icons.add, color: SplitBillsColors.PRIMARY_COLOR),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: model.bill.people.map((p) {
                      return PersonTile(p);
                    }).toList(),
                  ),
                )
              ],
            );
          }
      )
    );
  }
}
