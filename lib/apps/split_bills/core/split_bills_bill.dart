class SplitBillsBill {
  static const TABLE_NAME = 'BILL';
  static const _cItem = 'ITEM';
  static const _cPeople = 'PEOPLE';
  static const _cDiscount = 'DISCOUNT';
  static const _cTaxes = 'TAXES';

  static const CREATE_TABLE = "CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY, $_cItem TEXT, $_cPeople TEXT, $_cDiscount REAL, $_cTaxes REAL)";

  List<String> _items;
  List<String> _people;
  double discount, taxes;

  SplitBillsBill.createNew() {
    this._items = [];
    this._people = [];
    this.discount = 0.0;
    this.taxes = 0.0;
  }

  SplitBillsBill.fromDB(Map<String, dynamic> db) {
    this._items = db[_cItem].toString().split(", ");
    this._people = db[_cPeople].toString().split(", ");
    this.discount = db[_cDiscount];
    this.taxes = db[_cTaxes];
  }

  Map<String, dynamic> toDB() => {
    _cItem: this._items.join(", "),
    _cPeople: this._people.join(", "),
    _cDiscount: this.discount,
    _cTaxes: this.taxes
  };
}