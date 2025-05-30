import 'package:dio/dio.dart';

import '../../../../core/common/constant/url.dart';
import '../../../../core/common/network/dio/dio.dart';
import '../model/params/add_address_params.dart';

class AddressesRemote {
  DioClient dioClient;

  AddressesRemote({required this.dioClient});


  Future<Response> addAddresses({required AddAddressesParams addAddressesParams}) async {
    var jsonParams = addAddressesParams.toJson();

    late final Response response;
    response = await dioClient.post(
      url: AppUrl.addAddresses,
      data: jsonParams,
    );
    return response;
  }
  Future<Response> editAddresses({required AddAddressesParams addAddressesParams,required int id}) async {
    var jsonParams = addAddressesParams.toJson();

    late final Response response;
    response = await dioClient.put(
      url: "${AppUrl.addAddresses}/$id",
      data: jsonParams
    );
    return response;
  }

}