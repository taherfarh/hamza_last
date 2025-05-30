
import 'package:dio/dio.dart';

class ProfileSettingParams {
  final String? fullName;
  final String? image;
  final FormData? data;


  ProfileSettingParams({
     this.fullName,
     this.image,
    this.data,
  });
}
