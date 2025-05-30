import 'dart:convert';

import 'package:client_app/core/common/local_storage/hive_services.dart';
import 'package:client_app/features/payment/data/model/models/auth_payment_model.dart';
import 'package:client_app/features/payment/data/model/models/payment_link_model.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/constant/url.dart';
import '../../../../core/common/network/dio/dio.dart';
import '../model/models/all_carts_model.dart';
import '../../../home/data/model/model/count_carts_model.dart';
import '../model/models/filter_order_model.dart';
import '../model/models/show_carts_model.dart';
import '../model/models/show_order_model.dart';
import '../model/params/create_order_params.dart';
import '../model/params/filter_order_params.dart';
import '../model/params/payment_params.dart';
import '../model/params/send_id_method_params.dart';

class PaymentRemote {
  DioClient dioClient;

  PaymentRemote({required this.dioClient});

  Future<AllCartsModel> allCarts() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.carts,
    );
    return AllCartsModel.fromJson(response.data);
  }

  Future<ShowCartsModel> showCart({required int id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.carts}/$id",
    );
    return ShowCartsModel.fromJson(response.data);
  }

  Future<Response> deleteCart({required int id}) async {
    late final Response response;
    response = await dioClient.delete(
      url: "${AppUrl.carts}/$id",
    );
    return response;
  }

  Future<FilterOrderModel> allOrder(
      {required FilterOrderParams filterOrderParams}) async {
    late final Response response;
    response = await dioClient.post(
        url: AppUrl.filterOrder, data: filterOrderParams.toJson());
    return FilterOrderModel.fromJson(response.data);
  }

  Future<Response> createOrder(
      {required CreateOrderParams createParams}) async {
    late final Response response;
    response = await dioClient.post(
        url: AppUrl.createOrder, data: createParams.toJson());
    return response;
  }

  Future<ShowOrderModel> showOrder({required int id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.showOrder}/$id",
    );
    return ShowOrderModel.fromJson(response.data);
  }

  Future<Response> cancelOrder({required int id}) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.cancelOrder}/$id",
    );
    return response;
  }

  Future<AuthPaymentModel> authPayment() async {
    late final Response response;
    response = await dioClient.postPaymentAuth(
        url: "https://ksa.paymob.com/api/auth/tokens",
        data: json.encode(
          {
            "api_key":
                "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TlRNMU1Dd2libUZ0WlNJNkltbHVhWFJwWVd3aWZRLlVYNjhubk5oeE52VG1OTlBVLTBXTE9EMnBwUEZCWmNyWjVhMUtmU0Q2RDgyREZySGlUdk93OGtlZnpSSHQ3MDctSDhoemVyWDVMbnJKZGVCYV9DN3JR"
          },
        ),
        headers: {'Content-Type': 'application/json'});
    return AuthPaymentModel.fromJson(response.data);
  }

  Future<PaymentLinkModel> paymentLink({required PaymentParams paymentParams}) async {
    late final Response response;
    response = await dioClient.postPaymentAuth(
        url: "https://ksa.paymob.com/api/ecommerce/payment-links",

        data: FormData.fromMap({
          'amount_cents': paymentParams.amountCents,
          'payment_methods': paymentParams.paymentMethods,
          'email': paymentParams.email,
          'is_live': 'false',
          'full_name': paymentParams.fullName,
          'phone_number': paymentParams.phoneNumber,
          'description': paymentParams.description,
          'notification_url':
              'https://webhook.site/7bce5e72-d86a-4ef2-bacd-429ef570d793',
          'redirection_url': 'www.google.com'
        }),
        headers: {  'Authorization': 'Bearer ${getGeneral("paymentToken")}'
        });
    return PaymentLinkModel.fromJson(response.data);
  }


  Future<Response> paymentMethod({required SendIdMethodParams sendIdMethodParams}) async {
    late final Response response;
    response = await dioClient.post(
      url: "${AppUrl.orderPayed}/${sendIdMethodParams.id}",
      data: sendIdMethodParams.toJson()
    );
    return response;
  }

}
