import 'package:client_app/features/auth/data/model/models/register_model.dart';
import 'package:client_app/features/auth/data/model/params/otp_forget_password.dart';
import 'package:client_app/features/auth/data/model/params/otp_params.dart';
import 'package:client_app/features/auth/data/model/params/regester_params.dart';
import 'package:client_app/features/auth/data/model/params/reset_password_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/constant/url.dart';
import '../../../../core/common/network/dio/dio.dart';
import '../model/models/log_in_model.dart';
import '../model/params/image_for_register_param.dart';
import '../model/params/log_in_params.dart';
import '../model/params/phone_params.dart';

class AuthRemote {
  DioClient dioClient;

  AuthRemote({required this.dioClient});

  Future<LogInModel> login({
    required LoginParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.login,
      data: jsonParams,
    );
    return LogInModel.fromJson(response.data);
  }

  Future<RegisterModel> register({
    required RegisterParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.register,
      data: jsonParams,
    );
    return RegisterModel.fromJson(response.data);
  }

  Future<Response> otp({
    required OtpParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.otp,
      data: jsonParams,
    );
    return response;
  }

  Future<Response> phone({
    required PhoneParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.phone,
      data: jsonParams,
    );
    return response;
  }

  Future<Response> otpForgetPassword({
    required OtpForgetPasswordParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.otpForgetPassword,
      data: jsonParams,
    );
    return response;
  }

  Future<Response> resetPassword({
    required ResetPasswordParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.changePassword,
      data: jsonParams,
    );
    return response;
  }

  Future<Response> imageForRegister({
    required UploadParams params,
  }) async {
    FormData formData = FormData();
    formData.fields.add(MapEntry('phone', params.phone));
    formData.fields.add(MapEntry('password', params.password));

    // Add files to FormData
    formData.files.add(MapEntry(
        'id_image',
        await MultipartFile.fromFile(params.idImage,
            filename: 'id_image.jpg')));

    formData.files.add(
      MapEntry(
        'document_image',
        await MultipartFile.fromFile(params.documentImage,
            filename: 'document_image.jpg'),
      ),
    );

    late final Response response;
    response = await dioClient.postData(
      url: AppUrl.confirmIdentify,
      data: formData,
    );
    return response;
  }
}
