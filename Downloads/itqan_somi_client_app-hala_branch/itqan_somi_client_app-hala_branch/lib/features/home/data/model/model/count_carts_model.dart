// To parse this JSON data, do
//
//     final countCartsModel = countCartsModelFromJson(jsonString);

import 'dart:convert';

CountCartsModel countCartsModelFromJson(String str) => CountCartsModel.fromJson(json.decode(str));

String countCartsModelToJson(CountCartsModel data) => json.encode(data.toJson());

class CountCartsModel {
  final bool? success;
  final int? count;

  CountCartsModel({
    this.success,
    this.count,
  });

  factory CountCartsModel.fromJson(Map<String, dynamic> json) => CountCartsModel(
    success: json["success"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "count": count,
  };
}
