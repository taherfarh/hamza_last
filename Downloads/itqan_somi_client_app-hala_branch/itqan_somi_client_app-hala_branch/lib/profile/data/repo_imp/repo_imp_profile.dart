import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/common/network/error_handler.dart';
import '../../../core/common/network/failure.dart';
import '../../../core/common/network/network_info.dart';
import '../../../features/home/data/model/model/all_addresses_model.dart';
import '../data_source/remote.dart';
import '../model/models/about_us_model.dart';
import '../model/models/edit_profile_model.dart';
import '../model/models/our_message_model.dart';
import '../model/models/our_vession_model.dart';
import '../model/models/privacy_policy.dart';
import '../model/params/change_password_profile_param.dart';
import '../model/params/profile_setting_params.dart';

class RepoImpProfile {
  final ProfileRemote remote;
  final NetworkInfo networkInfo;

  RepoImpProfile({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AboutUsModel>> aboutUs() async {
    if (await networkInfo.isConnected) {
      try {
        AboutUsModel aboutUsModel = (await remote.aboutUs());
        return Right(aboutUsModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, OurVesionModel>> ourVision() async {
    if (await networkInfo.isConnected) {
      try {
        OurVesionModel ourVesionModel = (await remote.ourVissionModel());
        return Right(ourVesionModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, OurMessageModel>> ourMessage() async {
    if (await networkInfo.isConnected) {
      try {
        OurMessageModel ourMessageModel = (await remote.ourMessage());
        return Right(ourMessageModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, PrivacyPolicyModel>> privacy() async {
    if (await networkInfo.isConnected) {
      try {
        PrivacyPolicyModel privacyPolicyModel = (await remote.privacy());
        return Right(privacyPolicyModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> changePasswordProfile({required ChangePasswordProfileParams changePassword}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.resetPassword(changePassword: changePassword));
        return Right(response);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, EditProfileModel>> editProfile({required ProfileSettingParams profileSetting}) async {
    if (await networkInfo.isConnected) {
      try {
        EditProfileModel response = (await remote.editProfile( profileSettingParams: profileSetting));
        return Right(response);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, AllAddressesModel>> allAddresses() async {
    if (await networkInfo.isConnected) {
      try {
        AllAddressesModel response = (await remote.allAddresses());
        return Right(response);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}