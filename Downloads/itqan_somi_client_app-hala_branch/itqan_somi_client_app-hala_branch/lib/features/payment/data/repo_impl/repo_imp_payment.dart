import 'package:client_app/features/payment/data/data_source/remote.dart';
import 'package:client_app/features/payment/data/model/models/show_carts_model.dart';
import 'package:client_app/features/payment/data/model/params/create_order_params.dart';
import 'package:client_app/features/payment/data/model/params/payment_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/network_info.dart';
import '../model/models/all_carts_model.dart';
import '../model/models/auth_payment_model.dart';
import '../model/models/filter_order_model.dart';
import '../model/models/payment_link_model.dart';
import '../model/models/show_order_model.dart';
import '../model/params/filter_order_params.dart';
import '../model/params/send_id_method_params.dart';

class RepoImpPayment {
  final PaymentRemote remote;
  final NetworkInfo networkInfo;

  RepoImpPayment({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, AllCartsModel>> getAllCarts() async {
    if (await networkInfo.isConnected) {
      try {
        AllCartsModel allCartsModel = (await remote.allCarts());
        return Right(allCartsModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, ShowCartsModel>> showCart({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        ShowCartsModel showCartsModel = (await remote.showCart(id: id));
        return Right(showCartsModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> deleteCart({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.deleteCart(id: id));
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
  Future<Either<Failure, FilterOrderModel>> allOrder({required FilterOrderParams filterOrderParams}) async {
    if (await networkInfo.isConnected) {
      try {
        FilterOrderModel response = (await remote.allOrder(filterOrderParams: filterOrderParams));
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
  Future<Either<Failure, Response>> createOrder({required CreateOrderParams createOrderParams}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.createOrder(createParams: createOrderParams));
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
  Future<Either<Failure, ShowOrderModel>> showOrder(  { required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        ShowOrderModel showOrderModel = (await remote.showOrder(id: id));
        return Right(showOrderModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
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
  Future<Either<Failure, AuthPaymentModel>> paymentAuth( ) async {
    if (await networkInfo.isConnected) {
      try {
        AuthPaymentModel authPaymentModel = (await remote.authPayment());
        return Right(authPaymentModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, PaymentLinkModel>> paymentLinkModel({required PaymentParams paymentParams}) async {
    if (await networkInfo.isConnected) {
      try {
        PaymentLinkModel paymentLinkModel = (await remote.paymentLink(paymentParams: paymentParams));
        return Right(paymentLinkModel);
      } catch (e) {
        print("eeeeeeeeeee");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> sendIdMethod({required SendIdMethodParams sendIdMethodParams}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.paymentMethod(sendIdMethodParams: sendIdMethodParams));
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