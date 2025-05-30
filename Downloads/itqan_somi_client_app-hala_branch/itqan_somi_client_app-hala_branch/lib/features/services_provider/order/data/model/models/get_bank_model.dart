// To parse this JSON data, do
//
//     final getBankModel = getBankModelFromJson(jsonString);

import 'dart:convert';

GetBankModel getBankModelFromJson(String str) => GetBankModel.fromJson(json.decode(str));

String getBankModelToJson(GetBankModel data) => json.encode(data.toJson());

class GetBankModel {
  final bool? success;
  final String? message;
  final BankAccounts? bankAccounts;

  GetBankModel({
    this.success,
    this.message,
    this.bankAccounts,
  });

  factory GetBankModel.fromJson(Map<String, dynamic> json) => GetBankModel(
    success: json["success"],
    message: json["message"],
    bankAccounts: json["bank_accounts"] == null ? null : BankAccounts.fromJson(json["bank_accounts"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "bank_accounts": bankAccounts?.toJson(),
  };
}

class BankAccounts {
  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  BankAccounts({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory BankAccounts.fromJson(Map<String, dynamic> json) => BankAccounts(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  final int? id;
  final String? appUserId;
  final String? title;
  final String? number;
  final String? iban;
  final String? bank;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.appUserId,
    this.title,
    this.number,
    this.iban,
    this.bank,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    appUserId: json["app_user_id"],
    title: json["title"],
    number: json["number"],
    iban: json["IBAN"],
    bank: json["bank"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "title": title,
    "number": number,
    "IBAN": iban,
    "bank": bank,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
