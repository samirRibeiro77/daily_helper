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
    var billList = await _database.getAll(table: SplitBillsBill.TABLE_NAME);
    if (billList != null) {
      bill = SplitBillsBill.createNew();
      bill.id = await _database.insert(table: SplitBillsBill.TABLE_NAME, map: bill.toDB());
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
}