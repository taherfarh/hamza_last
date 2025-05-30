part of 'home_bloc.dart';

@immutable
sealed class HomeEvent extends Equatable {
  const HomeEvent();
}

class AllMainCategories extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class PopularServices extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ServicesFormSetting extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class CategoriesFormSetting extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class PopularServicesProvider extends HomeEvent {
  @override
  List<Object?> get props => [];
}
class GetAllServicesProvider extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class Filter extends HomeEvent {
  FilterParams filterParams;

  Filter(this.filterParams);

  @override
  List<Object?> get props => [filterParams];
}
class GetAllCategories extends HomeEvent {

  const GetAllCategories();

  @override
  List<Object?> get props => [];
}
class DetailsServices extends HomeEvent {
int id;
   DetailsServices(this.id);

  @override
  List<Object?> get props => [id];
}
class ServicesProviderDetails extends HomeEvent {
int id;
ServicesProviderDetails(this.id);

  @override
  List<Object?> get props => [id];
}
class AddCart extends HomeEvent {
  AddCartsParams params;
  AddCart({required this.params});

  @override
  List<Object?> get props => [params];
}
class AddFav extends HomeEvent {
  AddFavParams addFavParams ;
  AddFav({required this.addFavParams});
  @override
  List<Object?> get props => [addFavParams];
}
class AllFav extends HomeEvent {
  @override
  List<Object?> get props => [];
}
class CountCarts extends HomeEvent {

  @override
  List<Object?> get props => [];
}

class GetAllAddresses extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class DeleteFav extends HomeEvent {
  int id;
  DeleteFav(this.id);

  @override
  List<Object?> get props => [id];
}

class ServicesByCategories extends HomeEvent {
  int id;
  ServicesByCategories(this.id);

  @override
  List<Object?> get props => [id];
}
class AddReviews extends HomeEvent {
   AddRatingParams params;
  AddReviews(this.params);

  @override
  List<Object?> get props => [params];
}

class ChangeNotificationEvent extends HomeEvent {
  ChangeFcmTokenParams changeFcmTokenParams;

  ChangeNotificationEvent({required this.changeFcmTokenParams});

  @override
  List<Object?> get props => [changeFcmTokenParams];
}