// data/model/upload_params.dart
import 'dart:io';

class UploadParams {
  final String phone;
  final String password;
  final String idImage;
  final String documentImage;

  UploadParams({
    required this.phone,
    required this.password,
    required this.idImage,
    required this.documentImage,
  });
}
