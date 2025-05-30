// To parse this JSON data, do
//
//     final showCartsModel = showCartsModelFromJson(jsonString);

import 'dart:convert';

ShowCartsModel showCartsModelFromJson(String str) => ShowCartsModel.fromJson(json.decode(str));

String showCartsModelToJson(ShowCartsModel data) => json.encode(data.toJson());

class ShowCartsModel {
  final bool? success;
  final String? message;
  final Cart? cart;

  ShowCartsModel({
    this.success,
    this.message,
    this.cart,
  });

  factory ShowCartsModel.fromJson(Map<String, dynamic> json) => ShowCartsModel(
    success: json["success"],
    message: json["message"],
    cart: json["cart"] == null ? null : Cart.fromJson(json["cart"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "cart": cart?.toJson(),
  };
}

class Cart {
  final int? id;
  final String? appUserId;
  final String? serviceId;
  final String? date;
  final String? addressId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<AdditionCart>? additionCarts;
  final Service? service;
  final Address? address;

  Cart({
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

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    id: json["id"],
    appUserId: json["app_user_id"],
    serviceId: json["service_id"],
    date: json["date"],
    addressId: json["address_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    additionCarts: json["addition_carts"] == null ? [] : List<AdditionCart>.from(json["addition_carts"]!.map((x) => AdditionCart.fromJson(x))),
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
    address: json["address"] == null ? null : Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "service_id": serviceId,
    "date": date,
    "address_id": addressId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "addition_carts": additionCarts == null ? [] : List<dynamic>.from(additionCarts!.map((x) => x.toJson())),
    "service": service?.toJson(),
    "address": address?.toJson(),
  };
}

class AdditionCart {
  final int? id;
  final String? cartId;
  final String? additionId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Addition? addition;

  AdditionCart({
    this.id,
    this.cartId,
    this.additionId,
    this.createdAt,
    this.updatedAt,
    this.addition,
  });

  factory AdditionCart.fromJson(Map<String, dynamic> json) => AdditionCart(
    id: json["id"],
    cartId: json["cart_id"],
    additionId: json["addition_id"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    addition: json["addition"] == null ? null : Addition.fromJson(json["addition"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "cart_id": cartId,
    "addition_id": additionId,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "addition": addition?.toJson(),
  };
}

class Addition {
  final int? id;
  final String? serviceId;
  final String? title;
  final String? desc;
  final String? price;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Addition({
    this.id,
    this.serviceId,
    this.title,
    this.desc,
    this.price,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Addition.fromJson(Map<String, dynamic> json) => Addition(
    id: json["id"],
    serviceId: json["service_id"],
    title: json["title"],
    desc: json["desc"],
    price: json["price"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "service_id": serviceId,
    "title": title,
    "desc": desc,
    "price": price,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class Address {
  final int? id;
  final String? appUserId;
  final String? title;
  final String? location;
  final String? type;
  final String? city;
  final String? country;
  final String? house;
  final String? floor;
  final String? longitude;
  final String? latitude;
  final String? addressDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Address({
    this.id,
    this.appUserId,
    this.title,
    this.location,
    this.type,
    this.city,
    this.country,
    this.house,
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
    title: json["title"],
    location: json["location"],
    type: json["type"],
    city: json["city"],
    country: json["country"],
    house: json["house"],
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
    "title": title,
    "location": location,
    "type": type,
    "city": city,
    "country": country,
    "house": house,
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
  final User? user;
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
    this.user,
    this.category,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
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
  final String? image;
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
