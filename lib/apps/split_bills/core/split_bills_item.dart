import 'package:flutter/material.dart';

class SplitBillsItem {
  int id;
  String name;
  double value;
  List<int> people;

  SplitBillsItem({
    this.id,
    @required this.name,
    @required this.value,
    @required this.people
  });

  SplitBillsItem.fromJson(Map<String, dynamic> json) {
    var peopleList = json["people"] as List<dynamic>;

    this.id = int.parse(json["id"].toString());
    this.name = json["name"].toString();
    this.value = double.parse(json["value"].toString());
    this.people = peopleList.map((p) => p as int).toList();
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "value": value,
    "people": people
  };

  double get splitPrice => value / people.length;
}