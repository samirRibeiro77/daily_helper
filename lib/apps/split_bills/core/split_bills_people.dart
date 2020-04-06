class SplitBillsPeople {
  String _name;
  double value, discount, taxes;
  bool paid;

  SplitBillsPeople(this._name) {
    this.value = 0.0;
    this.discount = 0.0;
    this.taxes = 0.0;
    this.paid = false;
  }

  SplitBillsPeople.fromJson(Map<String, dynamic> json) {
    this._name = json["name"].toString();
    this.value = double.parse(json["value"].toString());
    this.discount = 0.0;
    this.taxes = 0.0;
    this.paid = json["paid"].toString().toLowerCase() == 'true';
  }

  Map<String, dynamic> toJson() => {
    "name": _name,
    "value": value,
    "paid": paid.toString()
  };

  String get name => _name;
  double get totalValue => value - ((value * discount) / 100) + ((value * taxes) / 100);
}