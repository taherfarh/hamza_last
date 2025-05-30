// To parse this JSON data, do
//
//     final allNotificationModel = allNotificationModelFromJson(jsonString);

import 'dart:convert';

AllNotificationModel allNotificationModelFromJson(String str) => AllNotificationModel.fromJson(json.decode(str));

String allNotificationModelToJson(AllNotificationModel data) => json.encode(data.toJson());

class AllNotificationModel {
  final bool? success;
  final String? message;
  final Notifications? notifications;

  AllNotificationModel({
    this.success,
    this.message,
    this.notifications,
  });

  factory AllNotificationModel.fromJson(Map<String, dynamic> json) => AllNotificationModel(
    success: json["success"],
    message: json["message"],
    notifications: json["notifications"] == null ? null : Notifications.fromJson(json["notifications"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "notifications": notifications?.toJson(),
  };
}

class Notifications {
  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Notifications({
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

  factory Notifications.fromJson(Map<String, dynamic> json) => Notifications(
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
  final String? id;
  final String? type;
  final String? notifiableType;
  final String? notifiableId;
  final DatumData? data;
  final dynamic readAt;
  final String? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.type,
    this.notifiableType,
    this.notifiableId,
    this.data,
    this.readAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    type: json["type"],
    notifiableType: json["notifiable_type"],
    notifiableId: json["notifiable_id"],
    data: json["data"] == null ? null : DatumData.fromJson(json["data"]),
    readAt: json["read_at"],
    createdAt: json["created_at"] ,
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "notifiable_type": notifiableType,
    "notifiable_id": notifiableId,
    "data": data?.toJson(),
    "read_at": readAt,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}

class DatumData {
  final String? message;
  final DataData? data;

  DatumData({
    this.message,
    this.data,
  });

  factory DatumData.fromJson(Map<String, dynamic> json) => DatumData(
    message: json["message"],
    data: json["data"] == null ? null : DataData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data?.toJson(),
  };
}

class DataData {
  final int? id;
  final String? customerId;
  final String? serviceProviderId;
  final String? qrCode;
  final String? desc;
  final String? useCoupon;
  final String? couponId;
  final String? beginPrice;
  final String? tax;
  final String? discountAmount;
  final String? totalPrice;
  final String? status;
  final String? paymentMethod;
  final dynamic paymentMethodInOnline;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<OrderItem>? orderItems;

  DataData({
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
    this.createdAt,
    this.updatedAt,
    this.orderItems,
  });

  factory DataData.fromJson(Map<String, dynamic> json) => DataData(
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "order_items": orderItems == null ? [] : List<dynamic>.from(orderItems!.map((x) => x.toJson())),
  };
}



enum Email {
  CLIENT1_GMAIL_COM,
  CLIENT_GMAIL_COM,
  HALA_GMAIL_COM,
  MAHMOUD_GMAIL_COM
}





class OrderItem {
  final int? id;
  final String? orderId;
  final String? serviceId;
  final DateTime? date;
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
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
    id: json["id"],
    orderId: json["order_id"],
    serviceId: json["service_id"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
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
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "service_id": serviceId,
    "date": date?.toIso8601String(),
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
  };
}




