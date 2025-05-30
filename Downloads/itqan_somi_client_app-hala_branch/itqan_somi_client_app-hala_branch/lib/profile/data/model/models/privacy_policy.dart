// To parse this JSON data, do
//
//     final privacyPolicyModel = privacyPolicyModelFromJson(jsonString);

import 'dart:convert';

PrivacyPolicyModel privacyPolicyModelFromJson(String str) => PrivacyPolicyModel.fromJson(json.decode(str));

String privacyPolicyModelToJson(PrivacyPolicyModel data) => json.encode(data.toJson());

class PrivacyPolicyModel {
  final bool? success;
  final String? message;
  final PrivacyPolicy? privacyPolicy;

  PrivacyPolicyModel({
    this.success,
    this.message,
    this.privacyPolicy,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) => PrivacyPolicyModel(
    success: json["success"],
    message: json["message"],
    privacyPolicy: json["privacy_policy"] == null ? null : PrivacyPolicy.fromJson(json["privacy_policy"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "privacy_policy": privacyPolicy?.toJson(),
  };
}

class PrivacyPolicy {
  final String? privacyPolicy;

  PrivacyPolicy({
    this.privacyPolicy,
  });

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) => PrivacyPolicy(
    privacyPolicy: json["privacy_policy"],
  );

  Map<String, dynamic> toJson() => {
    "privacy_policy": privacyPolicy,
  };
}
