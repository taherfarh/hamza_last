import 'dart:developer';

import 'package:client_app/features/home/data/data_source/remote.dart';
import 'package:client_app/features/home/data/model/model/all_main_categories_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/common/network/error_handler.dart';
import '../../../../core/common/network/failure.dart';
import '../../../../core/common/network/network_info.dart';
import '../model/model/all_fav_model.dart';
import '../model/model/all_addresses_model.dart';
import '../model/model/all_categories_model.dart';
import '../model/model/all_service_provider.dart';
import '../model/model/categories_form_setting_model.dart';
import '../model/model/count_carts_model.dart';
import '../model/model/details_services_model.dart';
import '../model/model/filter_model.dart';
import '../model/model/popular_services_model.dart';
import '../model/model/popular_services_provider_model.dart';
import '../model/model/services_by_categories_model.dart';
import '../model/model/services_form_setting_model.dart';
import '../model/model/services_provider_details_model.dart';
import '../model/params/add_carts_params.dart';
import '../model/params/add_fav_params.dart';
import '../model/params/add_rating_params.dart';
import '../model/params/change_fcm_token_params.dart';
import '../model/params/filter_params.dart';

class HomeRepositoryImpl {
  final HomeRemote remote;
  final NetworkInfo networkInfo;

  HomeRepositoryImpl({
    required this.remote,
    required this.networkInfo,
  });


  @override
  Future<Either<Failure, AllMainCategoriesModel>> allMainCategories() async {
    if (await networkInfo.isConnected) {
      try {
        AllMainCategoriesModel allMainCategoriesModel = (await remote.allMainCategories());
        return Right(allMainCategoriesModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, PopularServicesModel>> popularServices() async {
    if (await networkInfo.isConnected) {
      try {
        PopularServicesModel popularServicesModel = (await remote.popularServices());
        return Right(popularServicesModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, ServicesFormSettingModel>> servicesFormSetting() async {
    if (await networkInfo.isConnected) {
      try {
        ServicesFormSettingModel servicesFormSettingModel = (await remote.servicesFormSetting());
        return Right(servicesFormSettingModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, CategoriesFormSettingModel>> categoriesFormSetting() async {
    if (await networkInfo.isConnected) {
      try {
        CategoriesFormSettingModel categoriesFormSettingModel = (await remote.categoriesFormSetting());
        return Right(categoriesFormSettingModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, PopularServicesProviderModel>> popularServicesProvider() async {
    if (await networkInfo.isConnected) {
      try {
        PopularServicesProviderModel categoriesFormSettingModel = (await remote.popularServicesProvider());
        return Right(categoriesFormSettingModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, FilterModel>> filter(FilterParams params) async {
    if (await networkInfo.isConnected) {
      try {
        FilterModel filterModel = (await remote.search( params,));
        return Right(filterModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, AllServicesProviderModel>> getAllProvider() async {
    if (await networkInfo.isConnected) {
      try {
        AllServicesProviderModel allServicesProviderModel = (await remote.getAllProvider());
        return Right(allServicesProviderModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, AllCategoriesModel>> getAllCategories() async {
    if (await networkInfo.isConnected) {
      try {
        AllCategoriesModel allCategoriesModel = (await remote.getAllCategories());
        return Right(allCategoriesModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, AllAddressesModel>> getAllAddresses() async {
    if (await networkInfo.isConnected) {
      try {
        AllAddressesModel allAddressesModel = (await remote.getAllAddresses());
        return Right(allAddressesModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, DetailsServicesModel>> detailsServices({required int id }) async {
    if (await networkInfo.isConnected) {
      try {
        DetailsServicesModel detailsServicesModel = (await remote.detailsServices(id: id));
        return Right(detailsServicesModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, ServicesProviderDetailsModel>> servicesProviderDetails({required int id }) async {
    if (await networkInfo.isConnected) {
      try {
        ServicesProviderDetailsModel servicesProviderDetails= (await remote.servicesProviderDetails(id: id));
        return Right(servicesProviderDetails);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> addCarts({required AddCartsParams params }) async {
    if (await networkInfo.isConnected) {
      try {
        Response response= (await remote.addCarts(params: params));

        return Right(response);
      } catch (e) {
        print("cattttttttttttch");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> addFav({required AddFavParams addFavParams}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response= (await remote.addToFav(addFavParams: addFavParams));

        return Right(response);
      } catch (e) {
        print("cattttttttttttch");
        print(e);
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, CountCartsModel>> countCart() async {
    if (await networkInfo.isConnected) {
      try {
        CountCartsModel countCartsModel = (await remote.countCart());
        return Right(countCartsModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, AllFavModel>> allFav() async {
    if (await networkInfo.isConnected) {
      try {
        AllFavModel allFavModel = (await remote.allFav());
        return Right(allFavModel);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> deleteFav({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        Response  response = (await remote.deleteFav(id: id));
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, ServicesByCategoryModel>> servicesCategories({required int id}) async {
    if (await networkInfo.isConnected) {
      try {
        ServicesByCategoryModel  response = (await remote.servicesByCategory(id: id));
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
  Future<Either<Failure, Response>> addRating({required AddRatingParams params}) async {
    if (await networkInfo.isConnected) {
      try {
        Response  response = (await remote.addRating(params: params));
        return Right(response);
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  Future<Either<Failure, Response>> changeNotification(
      {required ChangeFcmTokenParams changeFcmParams}) async {
    if (await networkInfo.isConnected) {
      try {
        Response response =
        (await remote.changeFcmToken(changeFcmParams: changeFcmParams));
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