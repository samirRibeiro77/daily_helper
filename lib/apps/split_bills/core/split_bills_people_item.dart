import 'package:daily_helper/apps/split_bills/core/split_bills_people.dart';

class SplitBillsPeopleItem {
  String name, value;
  List<String> people;

  SplitBillsPeopleItem(this.name, this.value, this.people);

  List<SplitBillsPeople> save() {
    List<SplitBillsPeople> peopleList = [];
    this.people.forEach((p) {
      var peopleSave = SplitBillsPeople(p);
      peopleSave.value = double.parse(this.value) / people.length;
      peopleList.add(peopleSave);
    });
    return peopleList;
  }
}