import 'package:client_app/features/addresses/data/data_source/remote.dart';
import 'package:client_app/features/addresses/data/model/params/add_address_params.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/network_info.dart';
import '../../../payment/data/model/models/show_carts_model.dart';

class AddressesImp {
  final AddressesRemote remote;
  final NetworkInfo networkInfo;

  AddressesImp({
    required this.remote,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Response>> addAddresses({required AddAddressesParams addAddressesParams}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.addAddresses(addAddressesParams:addAddressesParams));
        return Right(response);
      } catch (e) {
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> editAddresses({required AddAddressesParams addAddressesParams ,required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response = (await remote.editAddresses(addAddressesParams:addAddressesParams, id: id));
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