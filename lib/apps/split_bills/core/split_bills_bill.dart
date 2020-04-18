import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';

class SplitBillsBill {
  List<SplitBillsItem> _items;
  List<SplitBillsPerson> _people;
  double discount, taxes;

  SplitBillsBill.createNew() {
    this._items = [];
    this._people = [];
    this.discount = 0.0;
    this.taxes = 0.0;
  }

  SplitBillsBill.fromJson(Map<String, dynamic> json) {
    var itemList = json["items"] as List<dynamic>;
    var peopleList = json["people"] as List<dynamic>;

    this._items = itemList.map((i) => SplitBillsItem.fromJson(i)).toList();
    this._people = peopleList.map((p) => SplitBillsPerson.fromJson(p)).toList();
    this.discount = 0.0;
    this.taxes = 0.0;
  }

  void addItem(SplitBillsItem item) {
    if (item.id == null) {
      item.id = this.items.length;
    }
    this._items.add(item);
    print(item.toJson());
  }

  void addPerson(SplitBillsPerson person) {
    if (person.id == null) {
      person.id = this.people.length;
    }
    this._people.add(person);
    print(person.toJson());
  }

  Map<String, dynamic> toJson() => {
    "items": this._items.map((i) {return i.toJson();}).toList(),
    "people": this._people.map((p) {return p.toJson();}).toList()
  };

  List<SplitBillsPerson> get people => _people;
  List<SplitBillsItem> get items => _items;
}