// To parse this JSON data, do
//
//     final district = districtFromJson(jsonString);

import 'dart:convert';

District districtFromJson(String str) => District.fromJson(json.decode(str));

String districtToJson(District data) => json.encode(data.toJson());

class District {
  Status status;
  List<DistrictData> data;

  District({
    required this.status,
    required this.data,
  });

  factory District.fromJson(Map<String, dynamic> json) => District(
    status: Status.fromJson(json["status"]),
    data: List<DistrictData>.from(json["data"].map((x) => DistrictData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status.toJson(),
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class DistrictData {
  String district;
  String districtbn;
  String coordinates;

  DistrictData({
    required this.district,
    required this.districtbn,
    required this.coordinates,
  });

  factory DistrictData.fromJson(Map<String, dynamic> json) => DistrictData(
    district: json["district"],
    districtbn: json["districtbn"],
    coordinates: json["coordinates"],
  );

  Map<String, dynamic> toJson() => {
    "district": district,
    "districtbn": districtbn,
    "coordinates": coordinates,
  };
}

class Status {
  int code;
  String message;
  String date;

  Status({
    required this.code,
    required this.message,
    required this.date,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
    code: json["code"],
    message: json["message"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
    "date": date,
  };
}
