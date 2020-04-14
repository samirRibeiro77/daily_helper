import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_database.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:scoped_model/scoped_model.dart';

class SplitBillModel extends Model {
  final _database = SplitBillsDatabase.instance;
  SplitBillsBill bill;

  bool isLoading = false;

  static SplitBillModel of(BuildContext context) =>
      ScopedModel.of<SplitBillModel>(context);

  @override
  void addListener(VoidCallback listener) async {
    super.addListener(listener);
    _startLoading();
    await _load();
    _finishLoading();
  }

  Future<Null> _load() async {
    _startLoading();
    bill = SplitBillsBill.createNew();
    var existBill = await _database.existBill();

    if(existBill) {
      var data = await _database.readData();
      bill = SplitBillsBill.fromJson(json.decode(data));
    }
    else {
      bill = SplitBillsBill.createNew();
    }
    _finishLoading();
  }

  void _startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void _finishLoading() {
    isLoading = false;
    notifyListeners();
  }

  void saveBill() {
    this._database.save(bill);
  }

  void addItem(SplitBillsItem item) {
    _startLoading();
    this.bill.addItem(item);
    this._database.save(bill);
    _finishLoading();
  }

  void addPerson(SplitBillsPerson person) {
    _startLoading();
    this.bill.addPerson(person);
    this._database.save(bill);
    _finishLoading();
  }

  void clearDatabase() {
    _startLoading();
    this._database.clearDatabase();
    _finishLoading();
  }
}