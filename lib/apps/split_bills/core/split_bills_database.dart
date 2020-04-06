import 'dart:io';
import 'package:daily_helper/apps/split_bills/core/split_bills_bill.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';

class SplitBillsDatabase {
  List<Function> _functions;

  SplitBillsDatabase._privateConstructor() {
    _functions = [];
  }

  static final SplitBillsDatabase instance = SplitBillsDatabase._privateConstructor();

  void addListener(Function f) {
    _functions.add(f);
  }

  void _execListeners() {
    _functions.forEach((f) {
      f();
    });
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    var file = File("${directory.path}/split_bills.json");
    var fileExists = await file.exists();
    if (!fileExists) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<String> readData() async {
    try {
      var data = await _getFile();
      return data.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<bool> existBill() async {
    try {
      var data = await _getFile();
      return data.exists();
    }
    catch (e) {
      return false;
    }
  }

  Future<File> save(SplitBillsBill bill) async {
    String dataJson = json.encode(bill.toJson());
    var file = await _getFile();
    file = await file.writeAsString(dataJson);

    _execListeners();

    return file;
  }

  Future<Null> clearDatabase() async {
    var peopleFile = await _getFile();
    peopleFile.delete(recursive: true);
  }
}