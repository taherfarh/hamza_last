class PopularServicesModel {
  bool? success;
  String? message;
  PopularServices? popularServices;

  PopularServicesModel({this.success, this.message, this.popularServices});

  PopularServicesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    popularServices = json['popular_services'] != null
        ? new PopularServices.fromJson(json['popular_services'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.popularServices != null) {
      data['popular_services'] = this.popularServices!.toJson();
    }
    return data;
  }
}

class PopularServices {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  PopularServices(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  PopularServices.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? appUserId;
  String? categoryId;
  String? name;
  String? desc;
  String? time;
  String? price;
  String? comparePrice;
  String? image;
  String? locationAddress;
  String? locationNeighborhood;
  String? locationCity;
  String? locationLongitude;
  String? locationLatitude;
  String? reviewAvg;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Tags>? tags;
  User? user;

  Data(
      {this.id,
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
        this.tags,
        this.user});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appUserId = json['app_user_id'];
    categoryId = json['category_id'];
    name = json['name'];
    desc = json['desc'];
    time = json['time'];
    price = json['price'];
    comparePrice = json['compare_price'];
    image = json['image'];
    locationAddress = json['location_address'];
    locationNeighborhood = json['location_neighborhood'];
    locationCity = json['location_city'];
    locationLongitude = json['location_longitude'];
    locationLatitude = json['location_latitude'];
    reviewAvg = json['review_avg'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_user_id'] = this.appUserId;
    data['category_id'] = this.categoryId;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['time'] = this.time;
    data['price'] = this.price;
    data['compare_price'] = this.comparePrice;
    data['image'] = this.image;
    data['location_address'] = this.locationAddress;
    data['location_neighborhood'] = this.locationNeighborhood;
    data['location_city'] = this.locationCity;
    data['location_longitude'] = this.locationLongitude;
    data['location_latitude'] = this.locationLatitude;
    data['review_avg'] = this.reviewAvg;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class Tags {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Tags({this.id, this.name, this.createdAt, this.updatedAt, this.pivot});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? new Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.pivot != null) {
      data['pivot'] = this.pivot!.toJson();
    }
    return data;
  }
}

class Pivot {
  String? serviceId;
  String? tagId;

  Pivot({this.serviceId, this.tagId});

  Pivot.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    tagId = json['tag_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['tag_id'] = this.tagId;
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? aboutHim;
  String? specialize;
  String? image;
  String? reviewAvg;
  String? otp;
  String? phoneVerifiedAt;
  String? status;
  String? idImage;
  String? documentImage;
  String? googleId;
  String? appleId;
  String? type;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
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
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    aboutHim = json['about_him'];
    specialize = json['specialize'];
    image = json['image'];
    reviewAvg = json['review_avg'];
    otp = json['otp'];
    phoneVerifiedAt = json['phone_verified_at'];
    status = json['status'];
    idImage = json['id_image'];
    documentImage = json['document_image'];
    googleId = json['google_id'];
    appleId = json['apple_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['about_him'] = this.aboutHim;
    data['specialize'] = this.specialize;
    data['image'] = this.image;
    data['review_avg'] = this.reviewAvg;
    data['otp'] = this.otp;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['status'] = this.status;
    data['id_image'] = this.idImage;
    data['document_image'] = this.documentImage;
    data['google_id'] = this.googleId;
    data['apple_id'] = this.appleId;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}