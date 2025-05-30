

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/common/network/error_handler.dart';
import '../../../../../core/common/network/failure.dart';
import '../../../../../core/common/network/network_info.dart';
import '../../../../home/data/model/params/change_fcm_token_params.dart';
import '../data_source/remote.dart';
import '../model/models/filter_all_order_services_provider_model.dart';
import '../model/models/get_bank_model.dart';
import '../model/models/order_count_model.dart';
import '../model/models/show_order_services_provider.dart';
import '../model/params/accept_reject_param.dart';
import '../model/params/bank_account_param.dart';
import '../model/params/change_fcm_token_dashBoard_params.dart';
import '../model/params/filter_order_params.dart';

class RepoImpDashBoard {
  final ServicesProviderRemote remote;
  final NetworkInfo networkInfo;

  RepoImpDashBoard({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, FilterServicesProviderOrderModel>> allOrder({required FilterOrderServicesProviderParams filterOrderParams}) async {
    if (await networkInfo.isConnected) {
      try {
        FilterServicesProviderOrderModel response = (await remote.allOrder(filterOrderParams: filterOrderParams));
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
  Future<Either<Failure, ShowOrderServicesProviderModel>> showOrder(  { required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        ShowOrderServicesProviderModel showOrderModel = (await remote.showOrder(id: id));
        return Right(showOrderModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> cancelOrder(  { required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response cancelOrder = (await remote.cancelOrder(id: id));
        return Right(cancelOrder);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, OrderCountModel>> orderCount() async {
    if (await networkInfo.isConnected) {
      try {
        OrderCountModel orderCountModel = (await remote.orderCount());
        return Right(orderCountModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> acceptReject({required AcceptRejectParams acceptReject }) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.acceptRejectOrder(acceptReject: acceptReject));
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
  Future<Either<Failure, GetBankModel>> getAllBank() async {
    if (await networkInfo.isConnected) {
      try {
        GetBankModel response = (await remote.getAllBankAccount());
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
  Future<Either<Failure, Response>> deliveryOrder({ required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.deliveryOrder(id: id));
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
  Future<Either<Failure, Response>> createBankAccount({required CreateAccountBankParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.createBankAccount(params: params));
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

  Future<Either<Failure, Response>> changeNotification(
      {required ChangeFcmTokenDashBaordParams changeFcmParams}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response =
        (await remote.changeFcmToken(changeFcmParams: changeFcmParams));
        return Right(response);
      } catch (e) {
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}