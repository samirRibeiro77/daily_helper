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
    try {
      var existBill = await _database.existBill();

      if(existBill) {
        var data = await _database.readData();
        bill = SplitBillsBill.fromJson(json.decode(data));
      }
      else {
        bill = SplitBillsBill.createNew();
      }
    }
    catch(e) {
      print(e);
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

  void addUpdateItem(SplitBillsItem item) {
    _startLoading();
    if (item.id != null) {
      this.bill.updateItem(item);
    }
    else {
      this.bill.addItem(item);
    }
    this._database.save(bill);
    _finishLoading();
  }

  void removeItem(int id) {
    _startLoading();
    try {
      var item = this.bill.items.firstWhere((i) => i.id == id);
      this.bill.items.remove(item);
      this._database.save(bill);
    }
    catch (e) {
      print(e);
    }
    _finishLoading();
  }

  void addUpdatePerson(SplitBillsPerson person) {
    _startLoading();
    if (person.id != null) {
      this.bill.updatePerson(person);
    }
    else {
      this.bill.addPerson(person);
    }
    this._database.save(bill);
    _finishLoading();
  }

  void removePerson(int id) {
    _startLoading();
    try {
      var person = this.bill.people.firstWhere((p) => p.id == id);

      this.bill.items
          .where((i) => i.people.contains(person.id))
          .forEach((i) { i.people.remove(person.id); });

      this.bill.people.remove(person);
      this._database.save(bill);
    }
    catch (e) {
      print(e);
    }
    _finishLoading();
  }

  void applyDiscount(double discount) {
    _startLoading();
    this.bill.discount = discount / 100;
    this._database.save(bill);
    _finishLoading();
  }

  void applyTaxes(double taxes) {
    _startLoading();
    this.bill.taxes = taxes / 100;
    this._database.save(bill);
    _finishLoading();
  }

  void peoplePaid(int id, bool value) {
    _startLoading();
    bill.people.firstWhere((p) => p.id == id).paid = value;
    _finishLoading();
  }

  void clearDatabase() async {
    _startLoading();
    await this._database.clearDatabase();
    bill = SplitBillsBill.createNew();
    _finishLoading();
  }
}