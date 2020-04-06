import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';

class SplitBillsPerson {
  String _name;
  List<String> items;
  bool paid;

  SplitBillsPerson(this._name) {
    this.items = [];
    this.paid = false;
  }

  SplitBillsPerson.fromJson(Map<String, dynamic> json) {
    var itemList = json["items"] as List<dynamic>;

    this._name = json["name"].toString();
    this.items = itemList.map((i) => i.toString()).toList();
    this.paid = json["paid"].toString().toLowerCase() == 'true';
  }

  Map<String, dynamic> toJson() => {
    "name": _name,
    "items": items,
    "paid": paid.toString()
  };

  String get name => _name;
  double totalPrice({double discount, double taxes, List<SplitBillsItem> listItem}) {
    var totalPrice = 0.0;
    listItem.where((i) => this.items.contains(i.name)).forEach((i) => totalPrice += i.splitValue);

    return totalPrice + (totalPrice * taxes) - (totalPrice * discount);
  }
}