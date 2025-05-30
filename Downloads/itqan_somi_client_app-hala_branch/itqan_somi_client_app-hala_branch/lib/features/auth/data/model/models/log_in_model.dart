class LogInModel {
  bool? success;
  String? message;
  AppUser? appUser;
  String? token;

  LogInModel({this.success, this.message, this.appUser, this.token});

  LogInModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    appUser = json['app_user'] != null
        ? new AppUser.fromJson(json['app_user'])
        : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.appUser != null) {
      data['app_user'] = this.appUser!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class AppUser {
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? otp;
  String? phoneVerifiedAt;
  String? status;
  String? type;
  String? createdAt;
  String? updatedAt;

  AppUser(
      {this.id,
        this.fullName,
        this.email,
        this.phone,
        this.password,
        this.otp,
        this.phoneVerifiedAt,
        this.status,
        this.type,
        this.createdAt,
        this.updatedAt});

  AppUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
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
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['status'] = this.status;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}