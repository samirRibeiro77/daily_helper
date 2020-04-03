class SplitBillsItem {
  String _name;
  String _value;

  SplitBillsItem(this._name, this._value);

  SplitBillsItem.fromJson(Map<String, dynamic> json) {
    this._name = json["name"].toString();
    this._value = json["value"].toString();
  }

  Map<String, dynamic> toJson() => {
    "name": _name,
    "value": value,
  };

  String get value => _value;
  String get name => _name;
}