// To parse this JSON data, do
//
//     final userExistModel = userExistModelFromJson(jsonString);

import 'dart:convert';

CheckUserExistModel userExistModelFromJson(String str) => CheckUserExistModel.fromJson(json.decode(str));

String userExistModelToJson(CheckUserExistModel data) => json.encode(data.toJson());

class CheckUserExistModel {
  int? statusCode;
  Data? data;
  String? errorMessage;

  CheckUserExistModel({
    this.statusCode,
     this.data,
     this.errorMessage,
  });

  factory CheckUserExistModel.fromJson(Map<String, dynamic> json) => CheckUserExistModel(
    statusCode: json["statusCode"],
    data: Data.fromJson(json["data"]),
    errorMessage: json["errorMessage"],
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "data": data?.toJson(),
    "errorMessage": errorMessage,
  };
}

class Data {
  int status;
  String pwd;
  int employeeId;
  int organizationId;


  Data({
    required this.status,
    required this.pwd,
    required this.employeeId,
    required this.organizationId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    status: json["status"],
    pwd: json["pwd"],
    employeeId: json["EmployeeId"],
    organizationId: json["OrganizationId"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "pwd": pwd,
    "EmployeeId": employeeId,
    "OrganizationId": organizationId,
  };
}
