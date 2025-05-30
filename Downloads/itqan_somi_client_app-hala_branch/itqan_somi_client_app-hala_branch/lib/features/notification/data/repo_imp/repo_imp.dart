import 'dart:developer';

import 'package:client_app/features/notification/data/data_source/remote.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/network_info.dart';
import '../model/all_notification.dart';
import '../../../home/data/model/params/change_fcm_token_params.dart';
import '../model/show_notification_model.dart';

class NotificationImpl {
  final NotificationRemote remote;
  final NetworkInfo networkInfo;

  NotificationImpl({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AllNotificationModel>> allNotification() async {
    if (await networkInfo.isConnected) {
      try {
        AllNotificationModel allNotificationModel =
            (await remote.allNotification());
        return Right(allNotificationModel);
      } catch (e) {
        log('========================= e in impl auth is $e============');
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, Response>> markAllAsRead() async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.markAllAsRead());
        return Right(response);
      } catch (e) {
        log('========================= e in impl auth is $e============');
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, Response>> markAsRead({required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.markAsRead(id: id));
        return Right(response);
      } catch (e) {
        log('========================= e in impl auth is $e============');
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, ShowNotificationModel>> showNotification(
      {required String id}) async {
    if (await networkInfo.isConnected) {
      try {
        ShowNotificationModel response =
            (await remote.showNotification(id: id));
        return Right(response);
      } catch (e) {
        log('========================= e in impl auth is $e============');
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}