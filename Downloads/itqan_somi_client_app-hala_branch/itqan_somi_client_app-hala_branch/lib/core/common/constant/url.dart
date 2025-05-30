class AppUrl {

  static String get baseUrl =>
      "https://mh-smmy.com/api/v1";

  static String get login => '$baseUrl/login';
  static String get register => '$baseUrl/register';
  static String get otp => '$baseUrl/set_otp';
  static String get carts => '$baseUrl/carts';
  static String get orderPayed => '$baseUrl/order_payed';
  static String get addReviews => '$baseUrl/reviews';
  static String get addFav => '$baseUrl/favorites';
  static String get servicesCategories => '$baseUrl/services_by_category';
  static String get showOrder => '$baseUrl/order';
  static String get showServicesProviderOrder => '$baseUrl/service_providers/order';
  static String get cancelOrder => '$baseUrl/cancel_order';
  static String get cancelServicesProviderOrder => '$baseUrl/service_providers/cancel_order';
  static String get orderCount => '$baseUrl/service_providers/order_count';
  static String get acceptReject => '$baseUrl/service_providers/accept_or_reject_order';
  static String get deliveryOrder => '$baseUrl/service_providers/delivery_order';
  static String get getBank => '$baseUrl/service_providers/bank_accounts';
  static String get filterOrder => '$baseUrl/filter_order';
  static String get filterOrderServiceProviders => '$baseUrl/service_providers/filter_order';
  static String get createOrder => '$baseUrl/order';
  static String get aboutUs => '$baseUrl/about_us';
  static String get ourVision => '$baseUrl/our_vision';
  static String get ourMessage => '$baseUrl/our_message';
  static String get privacyPolicy => '$baseUrl/privacy_policy';
  static String get changePasswordProfile => '$baseUrl/profile/change_password';
  static String get profileSetting => '$baseUrl/profile/edit';
  static String get deleteFav => '$baseUrl/favorites';
  static String get allAddresses => '$baseUrl/addresses';
  static String get addAddresses => '$baseUrl/addresses';
  static String get allNotification => '$baseUrl/notifications';
  static String get markAllAsRead => '$baseUrl/notifications/mark_all_as_read';
  static String get markAsRead => '$baseUrl/notifications/mark_as_read';
  static String get changeFcmToken => '$baseUrl/change_fcm_token';
  static String get showNotification => '$baseUrl/notifications';
  static String get countCart => '$baseUrl/carts_count';
  static String get phone => '$baseUrl/send_code_for_forget_password';
  static String get otpForgetPassword => '$baseUrl/set_otp_for_forget_password';
  static String get changePassword => '$baseUrl/change_password';
  static String get confirmIdentify => '$baseUrl/image_for_register';
  /// **************** home api *********
  static String get allMainCategories => '$baseUrl/categories';
  static String get popularServices => '$baseUrl/popular_services';
  static String get servicesFormModel => '$baseUrl/services_from_setting';
  static String get categoriesFromSetting => '$baseUrl/categories_from_setting';
  static String get popularServiceProviders => '$baseUrl/popular_service_providers';
  static String get search => '$baseUrl/filter';
  static String get allProvider => '$baseUrl/all_service_providers';
  static String get getAllAddresses => '$baseUrl/addresses';
  static String get allCategories => '$baseUrl/all_categories';
  static String get detailsServices => '$baseUrl/service';
  static String get serviceProviderDetails => '$baseUrl/service_provider';






}