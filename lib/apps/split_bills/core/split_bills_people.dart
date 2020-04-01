import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';

class SplitBillsPeople {
  final String _name;
  double _value;
  List<SplitBillsItem> _items;

  SplitBillsPeople(this._name) {
    this._value = 0.0;
    this._items = [];
  }

  void addItem(SplitBillsItem item) {
    this._items.add(item);
  }

  List<SplitBillsItem> get items => _items;
  double get value => _value;
  String get name => _name;
}