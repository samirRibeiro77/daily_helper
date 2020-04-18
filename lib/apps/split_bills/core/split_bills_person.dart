import 'package:flutter/material.dart';

class SplitBillsPerson {
  static const TABLE_NAME = 'PERSON';
  static const _cBillId = 'BILL_ID';
  static const _cName = 'NAME';
  static const _cPaid = 'PAID';

  static const CREATE_TABLE = "CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY, $_cBillId INTEGER, $_cName TEXT, $_cPaid INTEGER)";

  int id;
  String name;
  bool paid;

  SplitBillsPerson({@required this.name}) {
    this.paid = false;
  }

  SplitBillsPerson.fromDB(Map<String, dynamic> db) {
    this.id = db["id"];
    this.name = db[_cName];
    this.paid = db[_cPaid] == 1;
  }

  Map<String, dynamic> toDB() => {
    _cName: name,
    _cPaid: paid == true ? 1 : 0
  };
}