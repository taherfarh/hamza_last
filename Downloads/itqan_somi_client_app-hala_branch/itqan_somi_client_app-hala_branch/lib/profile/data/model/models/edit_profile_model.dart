class EditProfileModel {
  bool? success;
  String? message;
  AppUser? appUser;

  EditProfileModel({this.success, this.message, this.appUser});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? fullName;
  String? email;
  String? phone;
  String? image;
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
        this.image,
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
    image = json['image'];
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
    data['image'] = this.image;
    data['phone_verified_at'] = this.phoneVerifiedAt;
    data['status'] = this.status;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}