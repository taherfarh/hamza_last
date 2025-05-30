// To parse this JSON data, do
//
//     final popularServicesProviderModel = popularServicesProviderModelFromJson(jsonString);

import 'dart:convert';

PopularServicesProviderModel popularServicesProviderModelFromJson(String str) => PopularServicesProviderModel.fromJson(json.decode(str));

String popularServicesProviderModelToJson(PopularServicesProviderModel data) => json.encode(data.toJson());

class PopularServicesProviderModel {
  final bool? success;
  final String? message;
  final PopularServiceProviders? popularServiceProviders;

  PopularServicesProviderModel({
    this.success,
    this.message,
    this.popularServiceProviders,
  });

  factory PopularServicesProviderModel.fromJson(Map<String, dynamic> json) => PopularServicesProviderModel(
    success: json["success"],
    message: json["message"],
    popularServiceProviders: json["popular_service_providers"] == null ? null : PopularServiceProviders.fromJson(json["popular_service_providers"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "popular_service_providers": popularServiceProviders?.toJson(),
  };
}

class PopularServiceProviders {
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

  PopularServiceProviders({
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

  factory PopularServiceProviders.fromJson(Map<String, dynamic> json) => PopularServiceProviders(
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
  final String? fullName;
  final String? email;
  final String? phone;
  final dynamic aboutHim;
  final String? specialize;
  final dynamic image;
  final dynamic reviewAvg;
  final String? otp;
  final DateTime? phoneVerifiedAt;
  final String? status;
  final String? idImage;
  final String? documentImage;
  final dynamic googleId;
  final dynamic appleId;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.aboutHim,
    this.specialize,
    this.image,
    this.reviewAvg,
    this.otp,
    this.phoneVerifiedAt,
    this.status,
    this.idImage,
    this.documentImage,
    this.googleId,
    this.appleId,
    this.type,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    aboutHim: json["about_him"],
    specialize: json["specialize"],
    image: json["image"],
    reviewAvg: json["review_avg"],
    otp: json["otp"],
    phoneVerifiedAt: json["phone_verified_at"] == null ? null : DateTime.parse(json["phone_verified_at"]),
    status: json["status"],
    idImage: json["id_image"],
    documentImage: json["document_image"],
    googleId: json["google_id"],
    appleId: json["apple_id"],
    type: json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "full_name": fullName,
    "email": email,
    "phone": phone,
    "about_him": aboutHim,
    "specialize": specialize,
    "image": image,
    "review_avg": reviewAvg,
    "otp": otp,
    "phone_verified_at": phoneVerifiedAt?.toIso8601String(),
    "status": status,
    "id_image": idImage,
    "document_image": documentImage,
    "google_id": googleId,
    "apple_id": appleId,
    "type": type,
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
