class SplitBillsItem {
  String _name;
  double _value;
  int _peopleToSplit;

  SplitBillsItem(this._name, this._value, this._peopleToSplit);

  SplitBillsItem.fromJson(Map<String, dynamic> json) {
    this._name = json["name"].toString();
    this._value = double.parse(json["value"].toString());
    this._peopleToSplit = int.parse(json["peopleToSplit"].toString());
  }

  Map<String, dynamic> toJson() => {
    "name": _name,
    "value": _value,
    "peopleToSplit": _peopleToSplit
  };


  String get name => _name;
  double get splitValue => _value / _peopleToSplit;
  double get value => _value;
}