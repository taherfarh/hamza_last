import 'dart:convert';

ShowOrderModel showOrderModelFromJson(String str) => ShowOrderModel.fromJson(json.decode(str));

String showOrderModelToJson(ShowOrderModel data) => json.encode(data.toJson());

class ShowOrderModel {
  final bool? success;
  final String? message;
  final Order? order;

  ShowOrderModel({
    this.success,
    this.message,
    this.order,
  });

  factory ShowOrderModel.fromJson(Map<String, dynamic> json) => ShowOrderModel(
    success: json["success"],
    message: json["message"],
    order: json["order"] == null ? null : Order.fromJson(json["order"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "order": order?.toJson(),
  };
}

class Order {
  final int? id;
  final String? customerId;
  final String? serviceProviderId;
  final String? qrCode;
  final String? desc;
  final String? useCoupon;
  final dynamic couponId;
  final String? beginPrice;
  final String? tax;
  final String? discountAmount;
  final String? totalPrice;
  final String? status;
  final String? paymentMethod;
  final dynamic paymentMethodInOnline;
  final String? paymentDone;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<OrderItem>? orderItems;

  Order({
    this.id,
    this.customerId,
    this.serviceProviderId,
    this.qrCode,
    this.desc,
    this.useCoupon,
    this.couponId,
    this.beginPrice,
    this.tax,
    this.discountAmount,
    this.totalPrice,
    this.status,
    this.paymentMethod,
    this.paymentMethodInOnline,
    this.paymentDone,
    this.createdAt,
    this.updatedAt,
    this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"],
    customerId: json["customer_id"],
    serviceProviderId: json["service_provider_id"],
    qrCode: json["qr_code"],
    desc: json["desc"],
    useCoupon: json["use_coupon"],
    couponId: json["coupon_id"],
    beginPrice: json["begin_price"],
    tax: json["tax"],
    discountAmount: json["discount_amount"],
    totalPrice: json["total_price"],
    status: json["status"],
    paymentMethod: json["payment_method"],
    paymentMethodInOnline: json["payment_method_in_online"],
    paymentDone: json["payment_done"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    orderItems: json["order_items"] == null ? [] : List<OrderItem>.from(json["order_items"]!.map((x) => OrderItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "service_provider_id": serviceProviderId,
    "qr_code": qrCode,
    "desc": desc,
    "use_coupon": useCoupon,
    "coupon_id": couponId,
    "begin_price": beginPrice,
    "tax": tax,
    "discount_amount": discountAmount,
    "total_price": totalPrice,
    "status": status,
    "payment_method": paymentMethod,
    "payment_method_in_online": paymentMethodInOnline,
    "payment_done": paymentDone,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
  };
}

class OrderItem {
  final int? id;
  final String? orderId;
  final String? serviceId;
  final String? date;
  final String? location;
  final String? city;
  final String? country;
  final String? house;
  final String? floor;
  final String? longitude;
  final String? latitude;
  final String? price;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Service? service;
  final List<dynamic>? orderItemAdditions;

  OrderItem({
    this.id,
    this.orderId,
    this.serviceId,
    this.date,
    this.location,
    this.city,
    this.country,
    this.house,
    this.floor,
    this.longitude,
    this.latitude,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.service,
    this.orderItemAdditions,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    orderId: json["order_id"],
    serviceId: json["service_id"],
    date: json["date"] ,
    location: json["location"],
    city: json["city"],
    country: json["country"],
    house: json["house"],
    floor: json["floor"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    price: json["price"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    service: json["service"] == null ? null : Service.fromJson(json["service"]),
    orderItemAdditions: json["order_item_additions"] == null ? [] : List<dynamic>.from(json["order_item_additions"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "service_id": serviceId,
    "date": date,
    "location": location,
    "city": city,
    "country": country,
    "house": house,
    "floor": floor,
    "longitude": longitude,
    "latitude": latitude,
    "price": price,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "service": service?.toJson(),
    "order_item_additions": orderItemAdditions == null ? [] : List<dynamic>.from(orderItemAdditions!.map((x) => x)),
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
  final List<dynamic>? reviews;
  final User? user;

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
    reviews: json["reviews"] == null ? [] : List<dynamic>.from(json["reviews"]!.map((x) => x)),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
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
    "reviews": reviews == null ? [] : List<dynamic>.from(reviews!.map((x) => x)),
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
