import 'package:flutter/material.dart';

class SplitBillsItem {
  static const TABLE_NAME = 'ITEM';
  static const _cBillId = 'BILL_ID';
  static const _cName = 'NAME';
  static const _cValue = 'VALUE';
  static const _cPeople = 'PEOPLE';

  static const CREATE_TABLE = "CREATE TABLE $TABLE_NAME (id INTEGER PRIMARY KEY, $_cBillId INTEGER, $_cName TEXT, $_cPeople TEXT, $_cValue REAL)";

  int id;
  String name;
  double value;
  String people;

  SplitBillsItem({
    this.id,
    @required this.name,
    @required this.value,
    this.people
  });

  SplitBillsItem.fromDB(Map<String, dynamic> db) {
    this.id = db["id"];
    this.name = db[_cName];
    this.value = db[_cValue];
    this.people = db[_cPeople];
  }

  Map<String, dynamic> toDB() => {
    _cName: this.name,
    _cValue: this.value,
    _cPeople: this.people
  };
}