// To parse this JSON data, do
//
//     final authPaymentModel = authPaymentModelFromJson(jsonString);

import 'dart:convert';

AuthPaymentModel authPaymentModelFromJson(String str) => AuthPaymentModel.fromJson(json.decode(str));

String authPaymentModelToJson(AuthPaymentModel data) => json.encode(data.toJson());

class AuthPaymentModel {
  final String? token;

  AuthPaymentModel({
    this.token,
  });

  factory AuthPaymentModel.fromJson(Map<String, dynamic> json) => AuthPaymentModel(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}


