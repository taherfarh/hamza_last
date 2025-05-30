// To parse this JSON data, do
//
//     final aboutUsModel = aboutUsModelFromJson(jsonString);

import 'dart:convert';

AboutUsModel aboutUsModelFromJson(String str) => AboutUsModel.fromJson(json.decode(str));

String aboutUsModelToJson(AboutUsModel data) => json.encode(data.toJson());

class AboutUsModel {
  final bool? success;
  final String? message;
  final AboutUs? aboutUs;

  AboutUsModel({
    this.success,
    this.message,
    this.aboutUs,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) => AboutUsModel(
    success: json["success"],
    message: json["message"],
    aboutUs: json["about_us"] == null ? null : AboutUs.fromJson(json["about_us"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "about_us": aboutUs?.toJson(),
  };
}

class AboutUs {
  final String? aboutUs;

  AboutUs({
    this.aboutUs,
  });

  factory AboutUs.fromJson(Map<String, dynamic> json) => AboutUs(
    aboutUs: json["about_us"],
  );

  Map<String, dynamic> toJson() => {
    "about_us": aboutUs,
  };
}
