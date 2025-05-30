import 'package:dio/dio.dart';
import '../../../../../core/common/constant/url.dart';
import '../../../../../core/common/network/dio/dio.dart';
import '../../../../home/data/model/params/change_fcm_token_params.dart';
import '../model/models/filter_all_order_services_provider_model.dart';
import '../model/models/get_bank_model.dart';
import '../model/models/order_count_model.dart';
import '../model/models/show_order_services_provider.dart';
import '../model/params/accept_reject_param.dart';
import '../model/params/bank_account_param.dart';
import '../model/params/change_fcm_token_dashBoard_params.dart';
import '../model/params/filter_order_params.dart';

class ServicesProviderRemote {
  DioClient dioClient;

  ServicesProviderRemote({required this.dioClient});

  Future<FilterServicesProviderOrderModel> allOrder(
      {required FilterOrderServicesProviderParams filterOrderParams}) async {
    late final Response response;
    response = await dioClient.post(
        url: AppUrl.filterOrderServiceProviders,
        data: filterOrderParams.toJson());
    return FilterServicesProviderOrderModel.fromJson(response.data);
  }

  Future<ShowOrderServicesProviderModel> showOrder({required int id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.showServicesProviderOrder}/$id",
    );
    return ShowOrderServicesProviderModel.fromJson(response.data);
  }

  Future<Response> cancelOrder({required int id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.cancelServicesProviderOrder}/$id",
    );
    return response;
  }
  Future<OrderCountModel> orderCount() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.orderCount,
    );
    return OrderCountModel.fromJson(response.data);
  }
  Future<Response> acceptRejectOrder({required AcceptRejectParams acceptReject}) async {
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.acceptReject,
      data: acceptReject.toJson()

    );
    return response;
  }
  Future<Response> deliveryOrder({required int id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.deliveryOrder}/$id",
    );
    return response;
  }
  Future<GetBankModel> getAllBankAccount() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.getBank,
    );
    return GetBankModel.fromJson(response.data);
  }
  Future<Response> createBankAccount({required CreateAccountBankParams params}) async {
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.getBank,
      data: params.toJson()
    );
    return response;
  }

  Future<Response> changeFcmToken(
      { required ChangeFcmTokenDashBaordParams changeFcmParams}) async {
    print("ddddddddddddd");
    late final Response response;
    response = await dioClient.post(
      url: AppUrl.changeFcmToken,
      data: FormData.fromMap({
        'token': changeFcmParams.token,
        'user_id': changeFcmParams.userId
      }),
    );
    return response;
  }
}
