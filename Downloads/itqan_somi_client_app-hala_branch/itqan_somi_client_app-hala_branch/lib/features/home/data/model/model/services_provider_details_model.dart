// To parse this JSON data, do
//
//     final servicesProviderDetailsModel = servicesProviderDetailsModelFromJson(jsonString);

import 'dart:convert';

ServicesProviderDetailsModel servicesProviderDetailsModelFromJson(String str) => ServicesProviderDetailsModel.fromJson(json.decode(str));

String servicesProviderDetailsModelToJson(ServicesProviderDetailsModel data) => json.encode(data.toJson());

class ServicesProviderDetailsModel {
  final bool? success;
  final String? message;
  final ServiceProvider? serviceProvider;

  ServicesProviderDetailsModel({
    this.success,
    this.message,
    this.serviceProvider,
  });

  factory ServicesProviderDetailsModel.fromJson(Map<String, dynamic> json) => ServicesProviderDetailsModel(
    success: json["success"],
    message: json["message"],
    serviceProvider: json["service_provider"] == null ? null : ServiceProvider.fromJson(json["service_provider"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "service_provider": serviceProvider?.toJson(),
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
  final ServiceProvider? user;

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
    user: json["user"] == null ? null : ServiceProvider.fromJson(json["user"]),
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
  final List<Addition>? additions;

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
    this.additions,
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
    additions: json["additions"] == null ? [] : List<Addition>.from(json["additions"]!.map((x) => Addition.fromJson(x))),
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
    "additions": additions == null ? [] : List<dynamic>.from(additions!.map((x) => x.toJson())),
  };
}

class ServiceProvider {
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
  final String? phoneVerifiedAt;
  final String? status;
  final String? idImage;
  final String? documentImage;
  final dynamic googleId;
  final dynamic appleId;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Skill>? skills;
  final List<Service>? services;
  final List<WorkTime>? workTimes;

  ServiceProvider({
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
    this.skills,
    this.services,
    this.workTimes,
  });

  factory ServiceProvider.fromJson(Map<String, dynamic> json) => ServiceProvider(
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
    phoneVerifiedAt: json["phone_verified_at"] ,
    status: json["status"],
    idImage: json["id_image"],
    documentImage: json["document_image"],
    googleId: json["google_id"],
    appleId: json["apple_id"],
    type: json["type"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    skills: json["skills"] == null ? [] : List<Skill>.from(json["skills"]!.map((x) => Skill.fromJson(x))),
    services: json["services"] == null ? [] : List<Service>.from(json["services"]!.map((x) => Service.fromJson(x))),
    workTimes: json["work_times"] == null ? [] : List<WorkTime>.from(json["work_times"]!.map((x) => WorkTime.fromJson(x))),
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
    "phone_verified_at": phoneVerifiedAt,
    "status": status,
    "id_image": idImage,
    "document_image": documentImage,
    "google_id": googleId,
    "apple_id": appleId,
    "type": type,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "skills": skills == null ? [] : List<dynamic>.from(skills!.map((x) => x.toJson())),
    "services": services == null ? [] : List<dynamic>.from(services!.map((x) => x.toJson())),
    "work_times": workTimes == null ? [] : List<dynamic>.from(workTimes!.map((x) => x.toJson())),
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

class Skill {
  final int? id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Pivot? pivot;

  Skill({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
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
  final String? appUserId;
  final String? skillId;

  Pivot({
    this.appUserId,
    this.skillId,
  });

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    appUserId: json["app_user_id"],
    skillId: json["skill_id"],
  );

  Map<String, dynamic> toJson() => {
    "app_user_id": appUserId,
    "skill_id": skillId,
  };
}

class WorkTime {
  final int? id;
  final String? appUserId;
  final String? day;
  final String? startHour;
  final String? endHour;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  WorkTime({
    this.id,
    this.appUserId,
    this.day,
    this.startHour,
    this.endHour,
    this.createdAt,
    this.updatedAt,
  });

  factory WorkTime.fromJson(Map<String, dynamic> json) => WorkTime(
    id: json["id"],
    appUserId: json["app_user_id"],
    day: json["day"],
    startHour: json["start_hour"],
    endHour: json["end_hour"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "day": day,
    "start_hour": startHour,
    "end_hour": endHour,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
}
