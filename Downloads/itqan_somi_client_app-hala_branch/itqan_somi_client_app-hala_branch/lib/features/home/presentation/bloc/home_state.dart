part of 'home_bloc.dart';

@immutable
class HomeState extends Equatable {
  final BlocStatus<AllMainCategoriesModel> categoriesStatue;
  final BlocStatus<PopularServicesModel> popularServicesStatue;
  final BlocStatus<ServicesFormSettingModel> servicesFormSettingStatue;
  final BlocStatus<CategoriesFormSettingModel> categoriesFormSettingStatue;
  final BlocStatus<PopularServicesProviderModel> popularServicesProviderStatue;
  final BlocStatus<AllServicesProviderModel> allProviderModelStatue;
  final BlocStatus<AllCategoriesModel> allCategoriesStatue;
  final BlocStatus<FilterModel> filterStatue;
  final BlocStatus<DetailsServicesModel> detailsServicesStatue;
  final BlocStatus<ServicesProviderDetailsModel> servicesProviderDetailsStatue;
  final BlocStatus<AllAddressesModel> allAddressesStatue;
  final BlocStatus<CountCartsModel> countCartsStatue;
  final BlocStatus<Response> addCartsStatue;
  final BlocStatus<Response> addFavStatue;
  final BlocStatus<Response> addRatingStatue;
  final BlocStatus<Response> deleteFavStatue;
  final BlocStatus<AllFavModel> allFavStatue;
  final BlocStatus<ServicesByCategoryModel> servicesCategoriesStatue;
  final BlocStatus<Response> changeNotificationStatus;

  const HomeState({
    this.categoriesStatue = const BlocStatus(),
    this.popularServicesStatue = const BlocStatus(),
    this.servicesFormSettingStatue = const BlocStatus(),
    this.categoriesFormSettingStatue = const BlocStatus(),
    this.popularServicesProviderStatue = const BlocStatus(),
    this.filterStatue = const BlocStatus(),
    this.allProviderModelStatue = const BlocStatus(),
    this.allCategoriesStatue = const BlocStatus(),
    this.detailsServicesStatue = const BlocStatus(),
    this.servicesProviderDetailsStatue = const BlocStatus(),
    this.allAddressesStatue = const BlocStatus(),
    this.addCartsStatue = const BlocStatus(),
    this.countCartsStatue = const BlocStatus(),
    this.addFavStatue = const BlocStatus(),
    this.changeNotificationStatus = const BlocStatus(),
    this.addRatingStatue = const BlocStatus(),
    this.allFavStatue = const BlocStatus(),
    this.deleteFavStatue = const BlocStatus(),
    this.servicesCategoriesStatue = const BlocStatus(),
  });

  HomeState copyWith({
    BlocStatus<AllMainCategoriesModel>? categoriesStatue,
    BlocStatus<PopularServicesModel>? popularServicesStatue,
    BlocStatus<ServicesFormSettingModel>? servicesFormSettingStatue,
    BlocStatus<CategoriesFormSettingModel>? categoriesFormSettingStatue,
    BlocStatus<PopularServicesProviderModel>? popularServicesProviderStatue,
    BlocStatus<AllServicesProviderModel>? allProviderModelStatue,
    BlocStatus<FilterModel>? filterStatue,
    BlocStatus<AllCategoriesModel>? allCategoriesStatue,
    BlocStatus<DetailsServicesModel>? detailsServicesStatue,
    BlocStatus<ServicesProviderDetailsModel>? servicesProviderDetailsStatue,
    BlocStatus<AllAddressesModel>? allAddressesStatue,
    BlocStatus<CountCartsModel>? countCartsStatue,
    BlocStatus<Response>? addCartsStatue,
    BlocStatus<Response>? addFavStatue,
    BlocStatus<AllFavModel>? allFavStatue,
    BlocStatus<Response>? deleteFavStatue,
    BlocStatus<Response>? addRatingStatue,
    BlocStatus<ServicesByCategoryModel>? servicesCategoriesStatue,
    BlocStatus<Response>? changeNotificationStatus,
  }) {
    return HomeState(
        categoriesStatue: categoriesStatue ?? this.categoriesStatue,
        popularServicesStatue:
            popularServicesStatue ?? this.popularServicesStatue,
        servicesFormSettingStatue:
            servicesFormSettingStatue ?? this.servicesFormSettingStatue,
        categoriesFormSettingStatue:
            categoriesFormSettingStatue ?? this.categoriesFormSettingStatue,
        popularServicesProviderStatue:
            popularServicesProviderStatue ?? this.popularServicesProviderStatue,
        filterStatue: filterStatue ?? this.filterStatue,
        allProviderModelStatue:
            allProviderModelStatue ?? this.allProviderModelStatue,
        allCategoriesStatue: allCategoriesStatue ?? this.allCategoriesStatue,
        detailsServicesStatue:
            detailsServicesStatue ?? this.detailsServicesStatue,
        servicesProviderDetailsStatue:
            servicesProviderDetailsStatue ?? this.servicesProviderDetailsStatue,
        allAddressesStatue: allAddressesStatue ?? this.allAddressesStatue,
        addCartsStatue: addCartsStatue ?? this.addCartsStatue,
        countCartsStatue: countCartsStatue ?? this.countCartsStatue,
        addFavStatue: addFavStatue ?? this.addFavStatue,
        allFavStatue: allFavStatue ?? this.allFavStatue,
        deleteFavStatue: deleteFavStatue ?? this.deleteFavStatue,
        servicesCategoriesStatue:
            servicesCategoriesStatue ?? this.servicesCategoriesStatue,
        addRatingStatue: addRatingStatue ?? this.addRatingStatue,
        changeNotificationStatus:
            changeNotificationStatus ?? this.changeNotificationStatus);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        categoriesStatue,
        popularServicesStatue,
        servicesFormSettingStatue,
        categoriesFormSettingStatue,
        popularServicesProviderStatue,
        filterStatue,
        allProviderModelStatue,
        allCategoriesStatue,
        detailsServicesStatue,
        servicesProviderDetailsStatue,
        allAddressesStatue,
        addCartsStatue,
        countCartsStatue,
        addFavStatue,
        allFavStatue,
        deleteFavStatue,
        servicesCategoriesStatue,
        addRatingStatue,
        changeNotificationStatus
      ];
}
