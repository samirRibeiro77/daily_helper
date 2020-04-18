import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_person.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';

class SplitBillsDatabase {
  static const _dbName = 'dailyHelperSplitBills.db';
  static const _dbVersion = 1;

  Database _database;
  SplitBillsDatabase._privateConstructor() {_createOpenDatabase();}

  void _createOpenDatabase() async {
    _database = await openDatabase(_dbName, version: _dbVersion,
      onCreate: (db, version) async {
        //T_BILL
        try {
          await db.execute(SplitBillsBill.CREATE_TABLE);
        }
        catch(e) {
          print(e);
        }

        //T_ITEM
        try {
          await db.execute(SplitBillsItem.CREATE_TABLE);
        }
        catch(e) {
          print(e);
        }

        //T_PEOPLE
        try {
          await db.execute(SplitBillsPerson.CREATE_TABLE);
        }
        catch(e) {
          print(e);
        }
      }
    );
  }

  static final SplitBillsDatabase instance = SplitBillsDatabase._privateConstructor();

  Future<dynamic> get({
    @required String table,
    @required int id
  }) async {
    List<Map> result = await _database.rawQuery("SELECT * FROM $table WHERE id=$id");
    if (result.length <= 0) {
      return null;
    }

    return _getDatabaseRow(table, result.first);
  }

  Future<List<dynamic>> getAll({@required String table}) async {
    List<Map> result = await _database.query(table);
    if (result.length <= 0) {
      return null;
    }

    return result.map((i) => _getDatabaseRow(table, i)).toList();
  }

  Future<List<dynamic>> query({
    @required String table,
    @required List<String> where,
    @required List<dynamic> whereArgs
  }) async {
    List<Map> result = await _database.query(
        table,
        where: where.map((e) => "$e: ?").join(", "),
        whereArgs: whereArgs
    );

    if (result.length <= 0) {
      return null;
    }

    return result.map((i) => _getDatabaseRow(table, i)).toList();
  }

  dynamic _getDatabaseRow(String table, Map<String, dynamic> map) {
    switch(table) {
      case SplitBillsBill.TABLE_NAME: return SplitBillsBill.fromDB(map);
      case SplitBillsItem.TABLE_NAME: return SplitBillsItem.fromDB(map);
      case SplitBillsPerson.TABLE_NAME: return SplitBillsPerson.fromDB(map);
      default: return null;
    }
  }

  Future<int> insert({
    @required String table,
    @required Map<String, dynamic> map
  }) async {
    var id = await _database.insert(table, map);
    return id;
  }

  Future<int> update({
    @required String table,
    @required Map<String, dynamic> map,
    @required int id
  }) async {
    return await _database.update(table, map,
        where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete({
    @required String table,
    @required int id
  }) async {
    return await _database.delete(table, where: 'id = ?', whereArgs: [id]);
  }
}