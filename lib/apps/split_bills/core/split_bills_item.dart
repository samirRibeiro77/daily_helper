class SplitBillsItem {
  String _name;
  double _value;
  int peopleToSplit;

  SplitBillsItem(this._name, this._value, this.peopleToSplit);

  SplitBillsItem.fromJson(Map<String, dynamic> json) {
    this._name = json["name"].toString();
    this._value = double.parse(json["value"].toString());
    this.peopleToSplit = int.parse(json["peopleToSplit"].toString());
  }

  Map<String, dynamic> toJson() => {
    "name": _name,
    "value": _value,
    "peopleToSplit": peopleToSplit
  };


  String get name => _name;
  double get splitValue => _value / peopleToSplit;
  double get value => _value;
}