// To parse this JSON data, do
//
//     final servicesByCategoryModel = servicesByCategoryModelFromJson(jsonString);

import 'dart:convert';

ServicesByCategoryModel servicesByCategoryModelFromJson(String str) => ServicesByCategoryModel.fromJson(json.decode(str));

String servicesByCategoryModelToJson(ServicesByCategoryModel data) => json.encode(data.toJson());

class ServicesByCategoryModel {
  final bool? success;
  final String? message;
  final Services? services;

  ServicesByCategoryModel({
    this.success,
    this.message,
    this.services,
  });

  factory ServicesByCategoryModel.fromJson(Map<String, dynamic> json) => ServicesByCategoryModel(
    success: json["success"],
    message: json["message"],
    services: json["services"] == null ? null : Services.fromJson(json["services"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "services": services?.toJson(),
  };
}

class Services {
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

  Services({
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

  factory Services.fromJson(Map<String, dynamic> json) => Services(
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
  final String? categoryId;
  final String? name;
  final String? desc;
  final String? time;
  final String? price;
  final String? comparePrice;
  final String? image;
  final String? locationAddress;
  final String? locationNeighborhood;
  final String? locationCity;
  final String? locationLongitude;
  final String? locationLatitude;
  final String? reviewAvg;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Review>? reviews;
  final List<Tag>? tags;
  final User? user;
  final Category? category;

  Datum({
    this.id,
    this.appUserId,
    this.categoryId,
    this.name,
    this.desc,
    this.time,
    this.price,
    this.comparePrice,
    this.image,
    this.locationAddress,
    this.locationNeighborhood,
    this.locationCity,
    this.locationLongitude,
    this.locationLatitude,
    this.reviewAvg,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.reviews,
    this.tags,
    this.user,
    this.category,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    appUserId: json["app_user_id"],
    categoryId: json["category_id"],
    name: json["name"],
    desc: json["desc"],
    time: json["time"],
    price: json["price"],
    comparePrice: json["compare_price"],
    image: json["image"],
    locationAddress: json["location_address"],
    locationNeighborhood: json["location_neighborhood"],
    locationCity: json["location_city"],
    locationLongitude: json["location_longitude"],
    locationLatitude: json["location_latitude"],
    reviewAvg: json["review_avg"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    reviews: json["reviews"] == null ? [] : List<Review>.from(json["reviews"]!.map((x) => Review.fromJson(x))),
    tags: json["tags"] == null ? [] : List<Tag>.from(json["tags"]!.map((x) => Tag.fromJson(x))),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "category_id": categoryId,
    "name": name,
    "desc": desc,
    "time": time,
    "price": price,
    "compare_price": comparePrice,
    "image": image,
    "location_address": locationAddress,
    "location_neighborhood": locationNeighborhood,
    "location_city": locationCity,
    "location_longitude": locationLongitude,
    "location_latitude": locationLatitude,
    "review_avg": reviewAvg,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x.toJson())),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "user": user?.toJson(),
    "category": category?.toJson(),
  };
}

class Category {
  final int? id;
  final String? parentId;
  final String? name;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? activeChildren;

  Category({
    this.id,
    this.parentId,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.activeChildren,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    activeChildren: json["active_children"] == null ? [] : List<dynamic>.from(json["active_children"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "active_children": activeChildren == null ? [] : List<dynamic>.from(activeChildren!.map((x) => x)),
  };
}

class Review {
  final int? id;
  final String? appUserId;
  final String? serviceId;
  final String? comment;
  final String? rate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final User? user;

  Review({
    this.id,
    this.appUserId,
    this.serviceId,
    this.comment,
    this.rate,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  factory Review.fromJson(Map<String, dynamic> json) => Review(
    id: json["id"],
    appUserId: json["app_user_id"],
    serviceId: json["service_id"],
    comment: json["comment"],
    rate: json["rate"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "service_id": serviceId,
    "comment": comment,
    "rate": rate,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "user": user?.toJson(),
  };
}

class User {
  final int? id;
  final String? fullName;
  final String? email;
  final String? phone;
  final String? aboutHim;
  final String? specialize;
  final dynamic image;
  final dynamic fcmToken;
  final String? reviewAvg;
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

  User({
    this.id,
    this.fullName,
    this.email,
    this.phone,
    this.aboutHim,
    this.specialize,
    this.image,
    this.fcmToken,
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

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    fullName: json["full_name"],
    email: json["email"],
    phone: json["phone"],
    aboutHim: json["about_him"],
    specialize: json["specialize"],
    image: json["image"],
    fcmToken: json["fcm_token"],
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
    "fcm_token": fcmToken,
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

class Tag {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Tag({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    name: json["name"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot?.toJson(),
  };
}

class Pivot {
  final String? serviceId;
  final String? tagId;

  Pivot({
    this.serviceId,
    this.tagId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    serviceId: json["service_id"],
    tagId: json["tag_id"],
  );

  Map<String, dynamic> toJson() => {
    "service_id": serviceId,
    "tag_id": tagId,
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
