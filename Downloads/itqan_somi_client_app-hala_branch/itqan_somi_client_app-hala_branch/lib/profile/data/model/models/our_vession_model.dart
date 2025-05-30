// To parse this JSON data, do
//
//     final ourVesionModel = ourVesionModelFromJson(jsonString);

import 'dart:convert';

OurVesionModel ourVesionModelFromJson(String str) => OurVesionModel.fromJson(json.decode(str));

String ourVesionModelToJson(OurVesionModel data) => json.encode(data.toJson());

class OurVesionModel {
  final bool? success;
  final String? message;
  final OurVision? ourVision;

  OurVesionModel({
    this.success,
    this.message,
    this.ourVision,
  });

  factory OurVesionModel.fromJson(Map<String, dynamic> json) => OurVesionModel(
    success: json["success"],
    message: json["message"],
    ourVision: json["our_vision"] == null ? null : OurVision.fromJson(json["our_vision"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "our_vision": ourVision?.toJson(),
  };
}

class OurVision {
  final String? ourVision;

  OurVision({
    this.ourVision,
  });

  factory OurVision.fromJson(Map<String, dynamic> json) => OurVision(
    ourVision: json["our_vision"],
  );

  Map<String, dynamic> toJson() => {
    "our_vision": ourVision,
  };
}
