import 'package:flutter/material.dart';

class SplitBillsPerson {
  int id;
  String name;
  bool paid;

  SplitBillsPerson({@required this.name}) {
    this.paid = false;
  }

  SplitBillsPerson.fromJson(Map<String, dynamic> json) {
    this.id = int.parse(json["id"].toString());
    this.name = json["name"].toString();
    this.paid = json["paid"].toString().toLowerCase() == 'true';
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "paid": paid.toString()
  };
}