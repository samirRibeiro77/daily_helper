import 'dart:io';
import 'dart:convert';
import 'package:daily_helper/apps/split_bills/core/split_bills_item.dart';
import 'package:daily_helper/apps/split_bills/core/split_bills_people.dart';
import 'package:path_provider/path_provider.dart';

class SplitBillsDatabase {
  static const String PEOPLE_FILE = "people.json";
  static const String ITEMS_FILE = "item.json";

  Future<File> _getFile(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    var file = File("${directory.path}/$fileName");
    var fileExists = await file.exists();
    if (!fileExists) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<String> readData(String fileName) async {
    try {
      var data = await _getFile(fileName);
      return data.readAsString();
    } catch (e) {
      return null;
    }
  }

  Future<File> savePeople(List<SplitBillsPeople> listSave) async {
    var listMap = List<Map<String, dynamic>>();
    listSave.forEach((data) {
      listMap.add(data.toJson());
    });

    String dataJson = json.encode(listMap);
    final file = await _getFile(PEOPLE_FILE);
    return file.writeAsString(dataJson);
  }

  Future<File> saveItems(List<SplitBillsItem> listSave) async {
    var listMap = List<Map<String, dynamic>>();
    listSave.forEach((data) {
      listMap.add(data.toJson());
    });

    String dataJson = json.encode(listMap);
    final file = await _getFile(ITEMS_FILE);
    return file.writeAsString(dataJson);
  }

  Future<Null> clearDatabase() async {
    var peopleFile = await _getFile(PEOPLE_FILE);
    peopleFile.delete(recursive: true);

    var itemFile = await _getFile(ITEMS_FILE);
    itemFile.delete(recursive: true);
  }
}