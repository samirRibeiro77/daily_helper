import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';

class SplitBillsBill {
  List<SplitBillsItem> items;
  List<SplitBillsPerson> people;
  double discount, taxes;

  int _peopleId;
  int _itemId;

  SplitBillsBill.createNew() {
    this.items = [];
    this.people = [];
    this.discount = 0.0;
    this.taxes = 0.0;
    this._peopleId = 0;
    this._itemId = 0;
  }

  SplitBillsBill.fromJson(Map<String, dynamic> json) {
    var itemList = json["items"] as List<dynamic>;
    var peopleList = json["people"] as List<dynamic>;

    this.items = itemList.map((i) => SplitBillsItem.fromJson(i)).toList();
    this.people = peopleList.map((p) => SplitBillsPerson.fromJson(p)).toList();
    this._peopleId = json["peopleId"];
    this._itemId = json["itemId"];
    this.discount = 0.0;
    this.taxes = 0.0;
  }

  void addItem(SplitBillsItem item) {
    item.id = _itemId++;
    this.items.add(item);
  }

  void updateItem(SplitBillsItem item) {
    this.items.where((i) => i.id == item.id).first.name = item.name;
    this.items.where((i) => i.id == item.id).first.value = item.value;
    this.items.where((i) => i.id == item.id).first.people = item.people;
  }

  void addPerson(SplitBillsPerson person) {
    person.id = _peopleId++;
    this.people.add(person);
  }

  void updatePerson(SplitBillsPerson person) {
    this.people.where((p) => p.id == person.id).first.name = person.name;
    this.people.where((p) => p.id == person.id).first.paid = person.paid;
  }

  Map<String, dynamic> toJson() => {
    "items": this.items.map((i) {return i.toJson();}).toList(),
    "people": this.people.map((p) {return p.toJson();}).toList(),
    "peopleId": this._peopleId,
    "itemId": this._itemId
  };
}