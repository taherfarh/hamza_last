import 'dart:developer';

import 'package:client_app/features/auth/data/model/models/log_in_model.dart';
import 'package:client_app/features/auth/data/model/models/register_model.dart';
import 'package:client_app/features/auth/data/model/params/otp_forget_password.dart';
import 'package:client_app/features/auth/data/model/params/otp_params.dart';
import 'package:client_app/features/auth/data/model/params/phone_params.dart';
import 'package:client_app/features/auth/data/model/params/regester_params.dart';
import 'package:client_app/features/auth/data/model/params/reset_password_model.dart';
import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:client_app/features/auth/presentation/pages/otp_forget_password.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/network_info.dart';
import '../data_source/remote.dart';
import '../model/params/image_for_register_param.dart';
import '../model/params/log_in_params.dart';

class AuthRepositoryImpl {
  final AuthRemote remote;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, LogInModel>> login({
    required LoginParams loginParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        LogInModel logInModel = (await remote.login(params: loginParams));
        return Right(logInModel);
      } catch (e) {
        log('========================= e in impl auth is $e============');
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required RegisterParams registerParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        RegisterModel registerModel = (await remote.register(params: registerParams));
        return Right(registerModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, Response>> otp({
    required OtpParams otpParams,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        Response otp = (await remote.otp(params: otpParams));
        return Right(otp);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> phone({
    required PhoneParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        Response phone = (await remote.phone(params: params));
        return Right(phone);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }


  @override
  Future<Either<Failure, Response>> otpForgetPassword({
    required OtpForgetPasswordParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        Response phone = (await remote.otpForgetPassword(params: params));
        return Right(phone);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> resetPassword({
    required ResetPasswordParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        Response resetPassword = (await remote.resetPassword(params: params));
        return Right(resetPassword);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> upload({
    required UploadParams params,
  }) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.imageForRegister(params: params));
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
