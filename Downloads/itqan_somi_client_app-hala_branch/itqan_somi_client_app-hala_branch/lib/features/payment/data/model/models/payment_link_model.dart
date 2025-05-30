// To parse this JSON data, do
//
//     final paymentLinkModel = paymentLinkModelFromJson(jsonString);

import 'dart:convert';

PaymentLinkModel paymentLinkModelFromJson(String str) => PaymentLinkModel.fromJson(json.decode(str));

String paymentLinkModelToJson(PaymentLinkModel data) => json.encode(data.toJson());

class PaymentLinkModel {
  final int? id;
  final dynamic currency;
  final ClientInfo? clientInfo;
  final dynamic referenceId;
  final String? shortenUrl;
  final int? amountCents;
  final dynamic paymentLinkImage;
  final String? description;
  final DateTime? createdAt;
  final dynamic expiresAt;
  final String? clientUrl;
  final int? origin;
  final dynamic merchantStaffTag;
  final String? state;
  final dynamic paidAt;
  final String? redirectionUrl;
  final String? notificationUrl;
  final int? order;

  PaymentLinkModel({
    this.id,
    this.currency,
    this.clientInfo,
    this.referenceId,
    this.shortenUrl,
    this.amountCents,
    this.paymentLinkImage,
    this.description,
    this.createdAt,
    this.expiresAt,
    this.clientUrl,
    this.origin,
    this.merchantStaffTag,
    this.state,
    this.paidAt,
    this.redirectionUrl,
    this.notificationUrl,
    this.order,
  });

  factory PaymentLinkModel.fromJson(Map<String, dynamic> json) => PaymentLinkModel(
    id: json["id"],
    currency: json["currency"],
    clientInfo: json["client_info"] == null ? null : ClientInfo.fromJson(json["client_info"]),
    referenceId: json["reference_id"],
    shortenUrl: json["shorten_url"],
    amountCents: json["amount_cents"],
    paymentLinkImage: json["payment_link_image"],
    description: json["description"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    expiresAt: json["expires_at"],
    clientUrl: json["client_url"],
    origin: json["origin"],
    merchantStaffTag: json["merchant_staff_tag"],
    state: json["state"],
    paidAt: json["paid_at"],
    redirectionUrl: json["redirection_url"],
    notificationUrl: json["notification_url"],
    order: json["order"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "currency": currency,
    "client_info": clientInfo?.toJson(),
    "reference_id": referenceId,
    "shorten_url": shortenUrl,
    "amount_cents": amountCents,
    "payment_link_image": paymentLinkImage,
    "description": description,
    "created_at": createdAt?.toIso8601String(),
    "expires_at": expiresAt,
    "client_url": clientUrl,
    "origin": origin,
    "merchant_staff_tag": merchantStaffTag,
    "state": state,
    "paid_at": paidAt,
    "redirection_url": redirectionUrl,
    "notification_url": notificationUrl,
    "order": order,
  };
}

class ClientInfo {
  final String? email;
  final String? fullName;
  final String? phoneNumber;

  ClientInfo({
    this.email,
    this.fullName,
    this.phoneNumber,
  });

  factory ClientInfo.fromJson(Map<String, dynamic> json) => ClientInfo(
    email: json["email"],
    fullName: json["full_name"],
    phoneNumber: json["phone_number"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "full_name": fullName,
    "phone_number": phoneNumber,
  };
}
