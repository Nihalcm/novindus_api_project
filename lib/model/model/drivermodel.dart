// To parse this JSON data, do
//
//     final driver = driverFromJson(jsonString);

import 'dart:convert';

Driver driverFromJson(String str) => Driver.fromJson(json.decode(str));

String driverToJson(Driver data) => json.encode(data.toJson());
DriverElement driverlistFromJson(String str) => DriverElement.fromJson(json.decode(str));

String driverlistToJson(DriverElement data) => json.encode(data.toJson());
class Driver {
  List<DriverElement> drivers;
  bool status;

  Driver({
    required this.drivers,
    required this.status,
  });

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    drivers: List<DriverElement>.from(json["drivers"].map((x) => DriverElement.fromJson(x))),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "drivers": List<dynamic>.from(drivers.map((x) => x.toJson())),
    "status": status,
  };
}

class DriverElement {
  int? id;
  String name;
  String mobile;
  String licenseNo;

  DriverElement({
    this.id,
    required this.name,
    required this.mobile,
    required this.licenseNo,
  });

  factory DriverElement.fromJson(Map<String, dynamic> json) => DriverElement(
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

// To parse this JSON data, do
//
//     final deleteDrivers = deleteDriversFromJson(jsonString);
DeleteDrivers deleteDriversFromJson(String str) => DeleteDrivers.fromJson(json.decode(str));

String deleteDriversToJson(DeleteDrivers data) => json.encode(data.toJson());

class DeleteDrivers {
  bool status;
  Error? error; // Making 'error' nullable

  DeleteDrivers({
    required this.status,
    this.error, // Marking 'error' as optional
  });

  factory DeleteDrivers.fromJson(Map<String, dynamic> json) => DeleteDrivers(
    status: json["status"],
    error: json["error"] != null ? Error.fromJson(json["error"]) : null,
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "error": error != null ? error!.toJson() : null,
  };
}


class Error {
  List<String> driverId;

  Error({
    required this.driverId,
  });

  factory Error.fromJson(Map<String, dynamic> json) => Error(
    driverId: List<String>.from(json["driver_id"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "driver_id": List<dynamic>.from(driverId.map((x) => x)),
  };
}


