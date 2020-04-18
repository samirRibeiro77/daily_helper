class SplitBillsBill {
  static const TABLE_NAME = 'BILL';
  static const _cItem = 'ITEM';
  static const _cPeople = 'PEOPLE';
  static const _cDiscount = 'DISCOUNT';
  static const _cTaxes = 'TAXES';

  static const CREATE_TABLE = "CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY, $_cItem TEXT, $_cPeople TEXT, $_cDiscount REAL, $_cTaxes REAL)";

  int id;
  List<String> items;
  List<String> people;
  double discount, taxes;

  SplitBillsBill.createNew() {
    this.items = [];
    this.people = [];
    this.discount = 0.0;
    this.taxes = 0.0;
  }

  SplitBillsBill.fromDB(Map<String, dynamic> db) {
    this.items = db[_cItem].toString().split(", ");
    this.people = db[_cPeople].toString().split(", ");
    this.discount = db[_cDiscount];
    this.taxes = db[_cTaxes];
  }

  Map<String, dynamic> toDB() => {
    _cItem: this.items.join(", "),
    _cPeople: this.people.join(", "),
    _cDiscount: this.discount,
    _cTaxes: this.taxes
  };
}