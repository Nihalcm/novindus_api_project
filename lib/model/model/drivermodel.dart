// To parse this JSON data, do
//
//     final drivers = driversFromJson(jsonString);

import 'dart:convert';

Drivers driversFromJson(String str) => Drivers.fromJson(json.decode(str));

String driversToJson(Drivers data) => json.encode(data.toJson());
DriverList driverlistFromJson(String str) => DriverList.fromJson(json.decode(str));
String driverlistToJson(DriverList data) => json.encode(data.toJson());

class Drivers {
  List<DriverList> driverList;
  bool status;

  Drivers({
    required this.driverList,
    required this.status,
  });

  factory Drivers.fromJson(Map<String, dynamic> json) => Drivers(
    driverList: List<DriverList>.from(json["drivers"].map((x) => DriverList.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "driver_list": List<dynamic>.from(driverList.map((x) => DriverList.fromJson(x as Map<String, dynamic>))),
  };
}

class DriverList {
  int? id;
  String name;
  String mobile;
  String licenseNo;

  DriverList({
     this.id,
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });

  factory DriverList.fromJson(Map<String, dynamic> json) => DriverList(
    id: json["id"],
    name: json["name"],
    mobile: json["mobile"],
    licenseNo: json["license_no"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "mobile": mobile,
    "license_no": licenseNo,
  };
}
