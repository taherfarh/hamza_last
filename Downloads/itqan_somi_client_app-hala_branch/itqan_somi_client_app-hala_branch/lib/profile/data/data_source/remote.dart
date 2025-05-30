import 'package:client_app/profile/data/model/params/profile_setting_params.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/constant/url.dart';
import '../../../../core/common/network/dio/dio.dart';
import '../../../features/home/data/model/model/all_addresses_model.dart';
import '../model/models/about_us_model.dart';
import '../model/models/edit_profile_model.dart';
import '../model/models/our_message_model.dart';
import '../model/models/our_vession_model.dart';
import '../model/models/privacy_policy.dart';
import '../model/params/change_password_profile_param.dart';

class ProfileRemote {
  DioClient dioClient;

  ProfileRemote({required this.dioClient});

  Future<AboutUsModel> aboutUs() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.aboutUs,
    );
    return AboutUsModel.fromJson(response.data);
  }

  Future<OurVesionModel> ourVissionModel() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.ourVision,
    );
    return OurVesionModel.fromJson(response.data);
  }

  Future<OurMessageModel> ourMessage() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.ourMessage,
    );
    return OurMessageModel.fromJson(response.data);
  }

  Future<PrivacyPolicyModel> privacy() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.privacyPolicy,
    );
    return PrivacyPolicyModel.fromJson(response.data);
  }

  Future<Response> resetPassword(
      {required ChangePasswordProfileParams changePassword}) async {
    late final Response response;
    response = await dioClient.post(
        url: AppUrl.changePasswordProfile, data: changePassword.toJson());
    return response;
  }

  Future<EditProfileModel> editProfile(
      {required ProfileSettingParams profileSettingParams}) async {
    // FormData formData = FormData();
    // formData.fields.add(
    //   MapEntry(
    //       'full_name',
    //       profileSettingParams.fullName == null
    //           ? null.toString()
    //           : profileSettingParams.fullName.toString()),
    // );
    // formData.fields.add(
    //   MapEntry(
    //     'image',
    //     profileSettingParams.image == null
    //         ? "null"
    //         : MultipartFile.fromFile(profileSettingParams.image.toString(),
    //                 filename: 'image.jpg')
    //             .toString(),
    //   ),
    // );

    late final Response response;
    response = await dioClient.post(
      url: AppUrl.profileSetting,
      data: profileSettingParams.data,
    );
    return EditProfileModel.fromJson(response.data);
  }
  Future<AllAddressesModel> allAddresses() async {
    // FormData formData = FormData();
    // formData.fields.add(
    //   MapEntry(
    //       'full_name',
    //       profileSettingParams.fullName == null
    //           ? null.toString()
    //           : profileSettingParams.fullName.toString()),
    // );
    // formData.fields.add(
    //   MapEntry(
    //     'image',
    //     profileSettingParams.image == null
    //         ? "null"
    //         : MultipartFile.fromFile(profileSettingParams.image.toString(),
    //                 filename: 'image.jpg')
    //             .toString(),
    //   ),
    // );

    late final Response response;
    response = await dioClient.get(
      url: AppUrl.allAddresses,
    );
    return AllAddressesModel.fromJson(response.data);
  }
}
