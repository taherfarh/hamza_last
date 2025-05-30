import 'package:client_app/features/home/data/model/model/all_main_categories_model.dart';
import 'package:client_app/features/home/data/model/model/categories_form_setting_model.dart';
import 'package:client_app/features/home/data/model/model/filter_model.dart';
import 'package:client_app/features/home/data/model/model/popular_services_model.dart';
import 'package:client_app/features/home/data/model/params/filter_params.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/constant/url.dart';
import '../../../../core/common/network/dio/dio.dart';
import '../model/model/all_fav_model.dart';
import '../model/model/all_addresses_model.dart';
import '../model/model/all_categories_model.dart';
import '../model/model/all_service_provider.dart';
import '../model/model/count_carts_model.dart';
import '../model/model/details_services_model.dart';
import '../model/model/popular_services_provider_model.dart';
import '../model/model/services_by_categories_model.dart';
import '../model/model/services_form_setting_model.dart';
import '../model/model/services_provider_details_model.dart';
import '../model/params/add_carts_params.dart';
import '../model/params/add_fav_params.dart';
import '../model/params/add_rating_params.dart';
import '../model/params/change_fcm_token_params.dart';

class HomeRemote {
  DioClient dioClient;

  HomeRemote({required this.dioClient});

  Future<AllMainCategoriesModel> allMainCategories() async {
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.get(
      url: AppUrl.allMainCategories,
    );
    return AllMainCategoriesModel.fromJson(response.data);
  }

  Future<PopularServicesModel> popularServices() async {
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.get(
      url: AppUrl.popularServices,
    );
    return PopularServicesModel.fromJson(response.data);
  }

  Future<ServicesFormSettingModel> servicesFormSetting() async {
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.get(
      url: AppUrl.servicesFormModel,
    );
    return ServicesFormSettingModel.fromJson(response.data);
  }

  Future<CategoriesFormSettingModel> categoriesFormSetting() async {
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.get(
      url: AppUrl.categoriesFromSetting,
    );
    return CategoriesFormSettingModel.fromJson(response.data);
  }

  Future<PopularServicesProviderModel> popularServicesProvider() async {
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.get(
      url: AppUrl.popularServiceProviders,
    );
    return PopularServicesProviderModel.fromJson(response.data);
  }

  Future<FilterModel> search(FilterParams params) async {
    FormData formData = FormData();
    formData.fields.add(MapEntry('search', params.search ?? ""));
    formData.fields.add(
      MapEntry('service_provider_id', params.serviceProviderId ?? ""),
    );
    formData.fields.add(
      MapEntry('category_id', params.categoryId ?? ""),
    );
    formData.fields.add(
      MapEntry('max_price', params.maxPrice ?? ""),
    );
    formData.fields.add(
      MapEntry('min_price', params.minPrice ?? ""),
    );
    formData.fields.add(
      MapEntry('rate', params.rate ?? ""),
    );

    late final Response response;
    response = await dioClient.post(
      url: AppUrl.search,
      data: formData,
    );
    return FilterModel.fromJson(response.data);
  }

  Future<AllServicesProviderModel> getAllProvider() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.allProvider,
    );
    return AllServicesProviderModel.fromJson(response.data);
  }

  Future<AllCategoriesModel> getAllCategories() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.allCategories,
    );
    return AllCategoriesModel.fromJson(response.data);
  }

  Future<DetailsServicesModel> detailsServices({
    required int id,
  }) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.detailsServices}/$id",
    );
    return DetailsServicesModel.fromJson(response.data);
  }

  Future<ServicesProviderDetailsModel> servicesProviderDetails({
    required int id,
  }) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.serviceProviderDetails}/$id",
    );
    return ServicesProviderDetailsModel.fromJson(response.data);
  }

  Future<AllAddressesModel> getAllAddresses() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.getAllAddresses,
    );
    return AllAddressesModel.fromJson(response.data);
  }

  Future<Response> addCarts({
    required AddCartsParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.post(
      url: AppUrl.carts,
      data: FormData.fromMap({
        'service_id': params.serviceId,
      if(params.additionIds!=null)
        'addition_ids[]': params.additionIds,
        'date': params.date,
        'address_id': params.addressId,
        'confirm_delete': params.confirmDelete
      }),
    );
    return response;
  }

  Future<CountCartsModel> countCart() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.countCart,
    );
    return CountCartsModel.fromJson(response.data);
  }

  Future<Response> addToFav({required AddFavParams addFavParams}) async {
    late final Response response;
    response =
        await dioClient.post(url: AppUrl.addFav, data: addFavParams.toJson());
    return response;
  }

  Future<AllFavModel> allFav() async {
    late final Response response;
    response = await dioClient.get(
      url: AppUrl.addFav,
    );
    return AllFavModel.fromJson(response.data);
  }

  Future<Response> deleteFav({
    required int id,
  }) async {
    late final Response response;
    response = await dioClient.delete(
      url: "${AppUrl.addFav}/$id",
    );
    return response;
  }

  Future<ServicesByCategoryModel> servicesByCategory({
    required int id,
  }) async {
    late final Response response;
    response = await dioClient.get(
      url: "${AppUrl.servicesCategories}/$id",
    );
    return ServicesByCategoryModel.fromJson(response.data);
    ;
  }

  Future<Response> addRating({
    required AddRatingParams params,
  }) async {
    var jsonParams = params.toJson();
    // var data = FormData.fromMap({
    //   'username': params.userName,
    //   'password': params.password,
    // });

    late final Response response;
    response = await dioClient.post(
      url: AppUrl.addReviews,
      data: jsonParams,
    );
    return response;
  }


  Future<Response> changeFcmToken(
      { required ChangeFcmTokenParams changeFcmParams}) async {
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
