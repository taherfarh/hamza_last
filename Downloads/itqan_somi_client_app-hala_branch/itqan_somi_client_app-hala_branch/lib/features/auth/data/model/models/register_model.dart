class RegisterModel {
  bool? success;
  String? message;
  AppUser? appUser;

  RegisterModel({this.success, this.message, this.appUser});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    appUser = json['app_user'] != null
        ? new AppUser.fromJson(json['app_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.appUser != null) {
      data['app_user'] = this.appUser!.toJson();
    }
    return data;
  }
}

class AppUser {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  int? otp;
  String? type;
  String? updatedAt;
  String? createdAt;
  int? id;

  AppUser(
      {this.fullName,
        this.email,
        this.phone,
        this.password,
        this.otp,
        this.type,
        this.updatedAt,
        this.createdAt,
        this.id});

  AppUser.fromJson(Map<String, dynamic> json) {
    fullName = json['full_name'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    otp = json['otp'];
    type = json['type'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['otp'] = this.otp;
    data['type'] = this.type;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}