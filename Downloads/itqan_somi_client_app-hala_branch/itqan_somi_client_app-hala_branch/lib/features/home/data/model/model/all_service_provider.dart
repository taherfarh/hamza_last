class AllServicesProviderModel {
  bool? success;
  String? message;
  ServiceProviders? serviceProviders;

  AllServicesProviderModel({this.success, this.message, this.serviceProviders});

  AllServicesProviderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    serviceProviders = json['service_providers'] != null
        ? new ServiceProviders.fromJson(json['service_providers'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.serviceProviders != null) {
      data['service_providers'] = this.serviceProviders!.toJson();
    }
    return data;
  }
}

class ServiceProviders {
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

  ServiceProviders(
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

  ServiceProviders.fromJson(Map<String, dynamic> json) {
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
  String? fullName;
  String? email;
  String? phone;
  String? aboutHim;
  String? specialize;
  String? image;
  String? otp;
  String? phoneVerifiedAt;
  String? status;
  String? idImage;
  String? documentImage;
  String? type;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.aboutHim,
        this.specialize,
        this.image,
        this.otp,
        this.phoneVerifiedAt,
        this.status,
        this.idImage,
        this.documentImage,
        this.type,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    aboutHim = json['about_him'];
    specialize = json['specialize'];
    image = json['image'];
    otp = json['otp'];
    phoneVerifiedAt = json['phone_verified_at'];
    status = json['status'];
    idImage = json['id_image'];
    documentImage = json['document_image'];
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
    data['otp'] = this.otp;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['status'] = this.status;
    data['id_image'] = this.idImage;
    data['document_image'] = this.documentImage;
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