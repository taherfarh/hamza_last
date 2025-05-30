// To parse this JSON data, do
//
//     final allCartsModel = allCartsModelFromJson(jsonString);

import 'dart:convert';

AllCartsModel allCartsModelFromJson(String str) => AllCartsModel.fromJson(json.decode(str));

String allCartsModelToJson(AllCartsModel data) => json.encode(data.toJson());

class AllCartsModel {
  final bool? success;
  final String? message;
  final Carts? carts;
  final int? totalPrice;

  AllCartsModel({
    this.success,
    this.message,
    this.carts,
    this.totalPrice,
  });

  factory AllCartsModel.fromJson(Map<String, dynamic> json) => AllCartsModel(
    success: json["success"],
    message: json["message"],
    carts: json["carts"] == null ? null : Carts.fromJson(json["carts"]),
    totalPrice: json["total_price"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "carts": carts?.toJson(),
    "total_price": totalPrice,
  };
}

class Carts {
  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final String? nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Carts({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  factory Carts.fromJson(Map<String, dynamic> json) => Carts(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
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
  final String? serviceId;
  final DateTime? date;
  final String? addressId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? additionCarts;
  final Service? service;
  final Address? address;

  Datum({
    this.id,
    this.appUserId,
    this.serviceId,
    this.date,
    this.addressId,
    this.createdAt,
    this.updatedAt,
    this.additionCarts,
    this.service,
    this.address,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    appUserId: json["app_user_id"],
    serviceId: json["service_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    addressId: json["address_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    additionCarts: json["addition_carts"] == null ? [] : List<dynamic>.from(json["addition_carts"]!.map((x) => x)),
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "service_id": serviceId,
    "date": date?.toIso8601String(),
    "address_id": addressId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "addition_carts": additionCarts == null ? [] : List<dynamic>.from(additionCarts!.map((x) => x)),
    "service": service?.toJson(),
    "address": address?.toJson(),
  };
}

class Address {
  final int? id;
  final String? appUserId;
  final String? floor;
  final String? longitude;
  final String? latitude;
  final String? addressDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Address({
    this.id,
    this.appUserId,
    this.floor,
    this.longitude,
    this.latitude,
    this.addressDefault,
    this.createdAt,
    this.updatedAt,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    id: json["id"],
    appUserId: json["app_user_id"],
    floor: json["floor"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    addressDefault: json["default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "floor": floor,
    "longitude": longitude,
    "latitude": latitude,
    "default": addressDefault,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}



class Service {
  final int? id;
  final String? appUserId;
  final String? categoryId;
  final String? desc;
  final String? name;
  final String? image;
  final String? time;
  final String? price;
  final String? comparePrice;
  final String? locationLongitude;
  final String? locationLatitude;
  final String? reviewAvg;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? reviews;
  final Category? category;

  Service({
    this.id,
    this.appUserId,
    this.categoryId,
    this.name,
    this.desc,
    this.time,
    this.price,
    this.comparePrice,
    this.image,
    this.locationLongitude,
    this.locationLatitude,
    this.reviewAvg,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.reviews,
    this.category,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json["id"],
    appUserId: json["app_user_id"],
    categoryId: json["category_id"],
    desc: json["desc"],
    name: json["name"],
    time: json["time"],
    price: json["price"],
    image: json["image"],
    comparePrice: json["compare_price"],
    locationLongitude: json["location_longitude"],
    locationLatitude: json["location_latitude"],
    reviewAvg: json["review_avg"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "category_id": categoryId,
    "desc": desc,
    "time": time,
    "price": price,
    "name": name,
    "compare_price": comparePrice,
    "location_longitude": locationLongitude,
    "location_latitude": locationLatitude,
    "review_avg": reviewAvg,
    "status": status,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
    "category": category?.toJson(),
  };
}

class Category {
  final int? id;
  final dynamic parentId;
  final CategoryImage? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? activeChildren;

  Category({
    this.id,
    this.parentId,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.activeChildren,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    parentId: json["parent_id"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    activeChildren: json["active_children"] == null ? [] : List<dynamic>.from(json["active_children"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "active_children": activeChildren == null ? [] : List<dynamic>.from(activeChildren!.map((x) => x)),
  };
}

enum CategoryImage {
  THE_1734000427_OWT_SRA_A_BL_U_QX_HCM1_IP_UQ9_N_HD_YS_QJ9_BGSO29_B_V2_X1_JPG
}















