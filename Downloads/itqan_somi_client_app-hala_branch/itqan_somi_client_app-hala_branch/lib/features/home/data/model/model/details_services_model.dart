class DetailsServicesModel {
  bool? success;
  String? message;
  Service? service;
  List<SimilarServices>? similarServices;
  Favorite? favorite;

  DetailsServicesModel(
      {this.success,
        this.message,
        this.service,
        this.similarServices,
        this.favorite});

  DetailsServicesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    service =
    json['service'] != null ? new Service.fromJson(json['service']) : null;
    if (json['similar_services'] != null) {
      similarServices = <SimilarServices>[];
      json['similar_services'].forEach((v) {
        similarServices!.add(new SimilarServices.fromJson(v));
      });
    }
    favorite = json['favorite'] != null
        ? new Favorite.fromJson(json['favorite'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    if (this.similarServices != null) {
      data['similar_services'] =
          this.similarServices!.map((v) => v.toJson()).toList();
    }
    if (this.favorite != null) {
      data['favorite'] = this.favorite!.toJson();
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
  String? favoritesCount;
  List<Reviews>? reviews;
  User? user;
  Category? category;
  List<Additions>? additions;
  List<Questions>? questions;
  List<WorkingHours>? workingHours;
  List<Tags>? tags;

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
        this.favoritesCount,
        this.reviews,
        this.user,
        this.category,
        this.additions,
        this.questions,
        this.workingHours,
        this.tags});

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
    favoritesCount = json['favorites_count'];
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['additions'] != null) {
      additions = <Additions>[];
      json['additions'].forEach((v) {
        additions!.add(new Additions.fromJson(v));
      });
    }
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
    if (json['working_hours'] != null) {
      workingHours = <WorkingHours>[];
      json['working_hours'].forEach((v) {
        workingHours!.add(new WorkingHours.fromJson(v));
      });
    }
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(new Tags.fromJson(v));
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
    data['favorites_count'] = this.favoritesCount;
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.additions != null) {
      data['additions'] = this.additions!.map((v) => v.toJson()).toList();
    }
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    if (this.workingHours != null) {
      data['working_hours'] =
          this.workingHours!.map((v) => v.toJson()).toList();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
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
  String? aboutHim;
  String? specialize;
  String? image;
  String? fcmToken;
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
        this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    aboutHim = json['about_him'];
    specialize = json['specialize'];
    image = json['image'];
    fcmToken = json['fcm_token'];
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
    data['fcm_token'] = this.fcmToken;
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


class Category {
  int? id;
  String? parentId;
  String? name;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  List<Null>? activeChildren;

  Category(
      {this.id,
        this.parentId,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.activeChildren});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Additions {
  int? id;
  String? serviceId;
  String? title;
  String? desc;
  String? price;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  Additions(
      {this.id,
        this.serviceId,
        this.title,
        this.desc,
        this.price,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt});

  Additions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Questions {
  int? id;
  String? serviceId;
  String? question;
  String? answer;
  String? createdAt;
  String? updatedAt;

  Questions(
      {this.id,
        this.serviceId,
        this.question,
        this.answer,
        this.createdAt,
        this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['question'] = this.question;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class WorkingHours {
  int? id;
  String? serviceId;
  String? day;
  String? startHour;
  String? endHour;
  String? createdAt;
  String? updatedAt;

  WorkingHours(
      {this.id,
        this.serviceId,
        this.day,
        this.startHour,
        this.endHour,
        this.createdAt,
        this.updatedAt});

  WorkingHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceId = json['service_id'];
    day = json['day'];
    startHour = json['start_hour'];
    endHour = json['end_hour'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_id'] = this.serviceId;
    data['day'] = this.day;
    data['start_hour'] = this.startHour;
    data['end_hour'] = this.endHour;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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

class SimilarServices {
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

  SimilarServices(
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

  SimilarServices.fromJson(Map<String, dynamic> json) {
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

class Favorite {
  int? id;
  String? customerId;
  String? serviceId;
  String? createdAt;
  String? updatedAt;

  Favorite(
      {this.id,
        this.customerId,
        this.serviceId,
        this.createdAt,
        this.updatedAt});

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    serviceId = json['service_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['service_id'] = this.serviceId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}