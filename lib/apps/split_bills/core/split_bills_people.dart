class SplitBillsPeople {
  String _name;
  double value;

  SplitBillsPeople(this._name) {
    this.value = 0.0;
  }

  SplitBillsPeople.fromJson(Map<String, dynamic> json) {
    this._name = json["name"].toString();
    this.value = double.parse(json["value"].toString());
  }

  Map<String, dynamic> toJson() => {
    "name": _name,
    "value": value,
  };

  String get name => _name;
}