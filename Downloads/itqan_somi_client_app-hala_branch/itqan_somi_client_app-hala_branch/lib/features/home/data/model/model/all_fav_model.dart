class AllFavModel {
  bool? success;
  String? message;
  Favorites? favorites;

  AllFavModel({this.success, this.message, this.favorites});

  AllFavModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    favorites = json['Favorites'] != null
        ? new Favorites.fromJson(json['Favorites'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.favorites != null) {
      data['Favorites'] = this.favorites!.toJson();
    }
    return data;
  }
}

class Favorites {
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

  Favorites(
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

  Favorites.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add( Data.fromJson(v));
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
  String? customerId;
  String? serviceId;
  String? createdAt;
  String? updatedAt;
  Service? service;

  Data(
      {this.id,
        this.customerId,
        this.serviceId,
        this.createdAt,
        this.updatedAt,
        this.service});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
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
  List<Reviews>? reviews;

  Service(
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
        this.reviews});

  Service.fromJson(Map<String, dynamic> json) {
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
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reviews {
  int? id;
  String? appUserId;
  String? serviceId;
  String? comment;
  String? rate;
  String? createdAt;
  String? updatedAt;
  User? user;

  Reviews(
      {this.id,
        this.appUserId,
        this.serviceId,
        this.comment,
        this.rate,
        this.createdAt,
        this.updatedAt,
        this.user});

  Reviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appUserId = json['app_user_id'];
    serviceId = json['service_id'];
    comment = json['comment'];
    rate = json['rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['app_user_id'] = this.appUserId;
    data['service_id'] = this.serviceId;
    data['comment'] = this.comment;
    data['rate'] = this.rate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? otp;
  String? phoneVerifiedAt;
  String? status;
  String? type;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.otp,
        this.phoneVerifiedAt,
        this.status,
        this.type,
        this.createdAt,
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    otp = json['otp'];
    phoneVerifiedAt = json['phone_verified_at'];
    status = json['status'];
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
    data['otp'] = this.otp;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['status'] = this.status;
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