// To parse this JSON data, do
//
//     final ourMessageModel = ourMessageModelFromJson(jsonString);

import 'dart:convert';

OurMessageModel ourMessageModelFromJson(String str) => OurMessageModel.fromJson(json.decode(str));

String ourMessageModelToJson(OurMessageModel data) => json.encode(data.toJson());

class OurMessageModel {
  final bool? success;
  final String? message;
  final OurMessage? ourMessage;

  OurMessageModel({
    this.success,
    this.message,
    this.ourMessage,
  });

  factory OurMessageModel.fromJson(Map<String, dynamic> json) => OurMessageModel(
    success: json["success"],
    message: json["message"],
    ourMessage: json["our_message"] == null ? null : OurMessage.fromJson(json["our_message"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "our_message": ourMessage?.toJson(),
  };
}

class OurMessage {
  final String? ourMessage;

  OurMessage({
    this.ourMessage,
  });

  factory OurMessage.fromJson(Map<String, dynamic> json) => OurMessage(
    ourMessage: json["our_message"],
  );

  Map<String, dynamic> toJson() => {
    "our_message": ourMessage,
  };
}
