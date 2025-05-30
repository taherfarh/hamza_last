import 'package:bloc/bloc.dart';
import 'package:client_app/features/home/data/model/model/all_addresses_model.dart';
import 'package:client_app/features/home/data/model/model/all_main_categories_model.dart';
import 'package:client_app/features/home/data/model/model/popular_services_provider_model.dart';
import 'package:client_app/features/home/data/model/params/add_fav_params.dart';
import 'package:client_app/features/home/data/repo_imp/home_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/bloc_status/bloc_status.dart';
import '../../data/model/model/all_categories_model.dart';
import '../../data/model/model/all_fav_model.dart';
import '../../data/model/model/all_service_provider.dart';
import '../../data/model/model/categories_form_setting_model.dart';
import '../../data/model/model/count_carts_model.dart';
import '../../data/model/model/details_services_model.dart';
import '../../data/model/model/filter_model.dart';
import '../../data/model/model/popular_services_model.dart';
import '../../data/model/model/services_by_categories_model.dart';
import '../../data/model/model/services_form_setting_model.dart';
import '../../data/model/model/services_provider_details_model.dart';
import '../../data/model/params/add_carts_params.dart';
import '../../data/model/params/add_rating_params.dart';
import '../../data/model/params/change_fcm_token_params.dart';
import '../../data/model/params/filter_params.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepositoryImpl homeRepositoryImpl;

  HomeBloc(this.homeRepositoryImpl) : super(HomeState()) {
    on<HomeEvent>((event, emit) async {
      if (event is AllMainCategories) {
        emit(state.copyWith(categoriesStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.allMainCategories();
        result.fold(
          (fail) {
            emit(state.copyWith(
              categoriesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              categoriesStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is PopularServices) {
        emit(state.copyWith(popularServicesStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.popularServices();
        result.fold(
          (fail) {
            emit(state.copyWith(
              popularServicesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              popularServicesStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is ServicesFormSetting) {
        emit(state.copyWith(servicesFormSettingStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.servicesFormSetting();
        result.fold(
          (fail) {
            emit(state.copyWith(
              servicesFormSettingStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              servicesFormSettingStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is CategoriesFormSetting) {
        emit(state.copyWith(categoriesFormSettingStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.categoriesFormSetting();
        result.fold(
          (fail) {
            emit(state.copyWith(
              categoriesFormSettingStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              categoriesFormSettingStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is PopularServicesProvider) {
        emit(state.copyWith(
            popularServicesProviderStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.popularServicesProvider();
        result.fold(
          (fail) {
            emit(state.copyWith(
              popularServicesProviderStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              popularServicesProviderStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is Filter) {
        emit(state.copyWith(filterStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.filter(event.filterParams);
        result.fold(
          (fail) {
            emit(state.copyWith(
              filterStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              filterStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is GetAllServicesProvider) {
        emit(state.copyWith(allProviderModelStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.getAllProvider();
        result.fold(
          (fail) {
            emit(state.copyWith(
              allProviderModelStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(state.copyWith(
              allProviderModelStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is GetAllCategories) {
        emit(state.copyWith(allCategoriesStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.getAllCategories();
        result.fold(
          (fail) {
            emit(state.copyWith(
              allCategoriesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(
              state.copyWith(
                allCategoriesStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if (event is DetailsServices) {
        emit(state.copyWith(detailsServicesStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.detailsServices(id:event.id );
        result.fold(
          (fail) {
            emit(state.copyWith(
              detailsServicesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(
              state.copyWith(
                detailsServicesStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if (event is ServicesProviderDetails) {
        emit(state.copyWith(servicesProviderDetailsStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.servicesProviderDetails(id:event.id );
        result.fold(
          (fail) {
            emit(state.copyWith(
              servicesProviderDetailsStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(
              state.copyWith(
                servicesProviderDetailsStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if (event is GetAllAddresses) {
        emit(state.copyWith(allAddressesStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.getAllAddresses();
        result.fold(
          (fail) {
            emit(state.copyWith(
              allAddressesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(
              state.copyWith(
                allAddressesStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if (event is AddCart) {
        emit(state.copyWith(addCartsStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.addCarts(params: event.params);
        result.fold(
          (fail) {
            emit(state.copyWith(
              addCartsStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(
              state.copyWith(
                addCartsStatue: BlocStatus.success(
                  model: null,
                ),
              ),
            );
          },
        );
      }
      if (event is CountCarts) {
        emit(state.copyWith(countCartsStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.countCart();
        result.fold(
          (fail) {
            emit(state.copyWith(
              countCartsStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
          (model) {
            emit(
              state.copyWith(
                countCartsStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if(event is AddFav){
        emit(state.copyWith(addFavStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.addFav(addFavParams: event.addFavParams);
        result.fold(
              (fail) {
            emit(state.copyWith(
              addFavStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(
              state.copyWith(
                addFavStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if(event is AllFav){
        emit(state.copyWith(allFavStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.allFav();
        result.fold(
              (fail) {
            emit(state.copyWith(
              allFavStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(
              state.copyWith(
                allFavStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if(event is DeleteFav){
        emit(state.copyWith(deleteFavStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.deleteFav(id: event.id);
        result.fold(
              (fail) {
            emit(state.copyWith(
              deleteFavStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(
              state.copyWith(
                deleteFavStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if(event is ServicesByCategories){
        emit(state.copyWith(servicesCategoriesStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.servicesCategories(id: event.id);
        result.fold(
              (fail) {
            emit(state.copyWith(
              servicesCategoriesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(
              state.copyWith(
                servicesCategoriesStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }
      if(event is AddReviews){
        emit(state.copyWith(addRatingStatue: BlocStatus.loading()));
        final result = await homeRepositoryImpl.addRating(params: event.params);
        result.fold(
              (fail) {
            emit(state.copyWith(
              addRatingStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(
              state.copyWith(
                addRatingStatue: BlocStatus.success(
                  model: model,
                ),
              ),
            );
          },
        );
      }

      if (event is ChangeNotificationEvent) {
        emit(state.copyWith(changeNotificationStatus: BlocStatus.loading()));
        final result = await homeRepositoryImpl.changeNotification(
            changeFcmParams: event.changeFcmTokenParams);
        result.fold(
              (fail) {
            print(fail);
            emit(
              state.copyWith(
                changeNotificationStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ),
            );
          },
              (model) {
            emit(state.copyWith(
              changeNotificationStatus: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }

    });
  }
}
