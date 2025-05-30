import 'package:client_app/core/common/constant/dimension.dart';
import 'package:client_app/core/common/widgets/log_out.dart';
import 'package:client_app/features/auth/presentation/pages/confirm_identity.dart';
import 'package:client_app/features/auth/presentation/pages/forget_password_screen.dart';
import 'package:client_app/features/auth/presentation/pages/otp_forget_password.dart';
import 'package:client_app/features/auth/presentation/pages/send_request_page.dart';
import 'package:client_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:client_app/features/auth/presentation/pages/otp_screen.dart';
import 'package:client_app/features/home/presentation/screens/search_page.dart';
import 'package:client_app/features/home/presentation/widgets/view_all/all_categories.dart';
import 'package:client_app/features/payment/presentation/pages/payment_methode.dart';
import 'package:client_app/features/root/presentation/pages/root_page.dart';
import 'package:client_app/features/splash/presentation/widget/choose_account.dart';
import 'package:client_app/profile/presentation/state/profile_bloc.dart';
import 'package:client_app/profile/presentation/widget/edit_profile.dart';
import 'package:flutter/material.dart';

import '../../../features/auth/presentation/pages/reset_password_page.dart';
import '../../../features/auth/presentation/pages/sign_in_screen.dart';
import '../../../features/department/presentation/department_details.dart';
import '../../../features/department/presentation/department_screen.dart';
import '../../../features/home/presentation/bloc/home_bloc.dart';
import '../../../features/home/presentation/screens/details_page.dart';
import '../../../features/home/presentation/screens/home_page.dart';
import '../../../features/home/presentation/widgets/search_widget/filter_widget.dart';
import '../../../features/addresses/presentation/screens/add_new_location.dart';
import '../../../features/home/presentation/widgets/view_all/all_services.dart';
import '../../../features/home/presentation/widgets/view_all/all_services_provider.dart';
import '../../../features/notification/presentation/screens/notification_page.dart';
import '../../../features/payment/presentation/pages/booking_details.dart';
import '../../../features/payment/presentation/pages/booking_page.dart';
import '../../../features/payment/presentation/pages/cart_page.dart';
import '../../../features/payment/presentation/pages/payment_page.dart';
import '../../../features/home/presentation/widgets/services_provider.dart';
import '../../../features/payment/presentation/pages/register_payment.dart';
import '../../../features/payment/presentation/pages/web_payment_form.dart';
import '../../../features/services_provider/order/presentation/pages/add_new_bank_account.dart';
import '../../../features/services_provider/order/presentation/pages/bank_page.dart';
import '../../../features/services_provider/order/presentation/pages/dash_board_page.dart';
import '../../../features/services_provider/order/presentation/widget/order_services_provider_page.dart';
import '../../../features/services_provider/root_services_page.dart';
import '../../../features/splash/presentation/pages/on_boarding.dart';
import '../../../profile/presentation/widget/about_us_wigets.dart';
import '../../../profile/presentation/widget/all_addresses.dart';
import '../../../profile/presentation/widget/change_password_widget.dart';
import '../../../profile/presentation/widget/privacy.dart';
import '../../../profile/presentation/widget/all_fav.dart';

class Routes {
  //static variab  Routes._();les
  static const String splash = 'root/splash';
  static const String onBoarding =
      'lib/features/splash/presentation/pages/on_boarding.dart';
  static const String logIn =
      'lib/features/auth/presentation/pages/sign_in_screen.dart';
  static const String profileSetting =
      'lib/profile/presentation/pages/my_profile.dart';
  static const String signUp =
      'lib/features/auth/presentation/pages/sign_up_screen.dart';
  static const String otp =
      'lib/features/splash/presentation/pages/otp_screen.dart';
  static const String resetPassword =
      'lib/features/auth/presentation/pages/reset_password_page.dart';
  static const String rootPage =
      'lib/features/root/presentation/pages/root_page.dart';
  static const String searchPage =
      'lib/features/home/presentation/screens/search_page.dart';
  static const String filterPage =
      'lib/features/home/presentation/widgets/search_widget/filter_widget.dart';
  static const String detailsPage =
      'lib/features/home/presentation/screens/details_page.dart';
  static const String profilePage =
      'lib/features/home/presentation/widgets/services_provider.dart';
  static const String cartPage =
      'lib/features/payment/presentation/pages/cart_page.dart';
  static const String paymentPage =
      'lib/features/payment/presentation/pages/payment_page.dart';
  static const String addNewLocationPage =
      'lib/features/payment/presentation/pages/add_new_location.dart';
  static const String bookingPage =
      'lib/features/payment/presentation/pages/booking_page.dart';
  static const String bookingDetails =
      'lib/features/payment/presentation/pages/booking_details.dart';
  static const String paymentMethod =
      'lib/features/payment/presentation/pages/payment_methode.dart';
  static const String forgetPassword =
      'lib/features/auth/presentation/pages/forget_password_screen.dart';
  static const String otForgetPassword =
      'lib/features/auth/presentation/pages/otp_screen.dart';
  static const String confirmIdentity =
      'lib/features/auth/presentation/pages/confirm_identity.dart';
  static const String sendRequestPage =
      'lib/features/auth/presentation/pages/send_request_page.dart';
  static const String addToCart =
      'lib/features/home/presentation/widgets/services_details_widget/add_to_cart_widget.dart';
  static const String aboutUs =
      'lib/profile/presentation/widget/about_us_wigets.dart';
  static const String privacy =
      'lib/profile/data/model/models/privacy_policy.dart';
  static const String homePage =
      'lib/features/home/presentation/screens/home_page.dart';
  static const String chooseAccount =
      'lib/features/splash/presentation/widget/choose_account.dart';
  static const String allFav = 'lib/profile/presentation/widget/all_fav.dart';
  static const String logOut = 'lib/core/common/widgets/log_out.dart';
  static const String dashBoard =
      'lib/features/services_provider/presentation/pages/dash_board_page.dart';
  static const String changePasswordInProfile =
      'lib/profile/presentation/widget/change_password_widget.dart';
  static const String orderServicesProviderPage =
      'lib/features/services_provider/presentation/widget/order_services_provider_page.dart';
  static const String bank =
      'lib/features/services_provider/bank/presentation/pages/bank_page.dart';
  static const String addBankAccount =
      'lib/features/services_provider/bank/presentation/pages/add_new_bank_account.dart';
  static const String rootServicesProvider =
      'lib/features/services_provider/root_services_page.dart';
  static const String departmentDetails =
      'lib/features/department/presentation/department_details.dart';
  static const String notification =
      'lib/features/notification/presentation/screens/notification_page.dart';
  static const String editProfile =
      'lib/profile/presentation/widget/edit_profile.dart';
  static const String department =
      'lib/features/department/presentation/department_screen.dart';
  static const String allServices =
      'lib/features/home/presentation/widgets/view_all/all_services.dart';
  static const String allCategories =
      'lib/features/home/presentation/widgets/view_all/all_categories.dart';
  static const String allServicesProvider =
      'lib/features/home/presentation/widgets/view_all/all_services_provider.dart';
  static const String allAddresses =
      'lib/profile/presentation/widget/all_addresses.dart';
  static const String paymentRegister =
      'lib/features/payment/presentation/pages/register_payment.dart';
  static const String webPaymentForm =
      'lib/features/payment/presentation/pages/web_payment_form.dart';

  static final routes = <String, WidgetBuilder>{
    onBoarding: (BuildContext context) => const OnboardingScreen(),
    logIn: (BuildContext context) => LogInScreen(),
    signUp: (BuildContext context) => SignUpScreen(),
    otp: (BuildContext context) => OtpScreen(),
    resetPassword: (BuildContext context) => ResetPassword(),
    rootPage: (BuildContext context) => RootPage(),
    searchPage: (BuildContext context) => SearchPage(),
    filterPage: (BuildContext context) => FilterWidget(),
    detailsPage: (BuildContext context) => DetailsPage(),
    profilePage: (BuildContext context) => ProfilePage(),
    cartPage: (BuildContext context) => CartPage(),
    paymentPage: (BuildContext context) => PaymentPage(),
    addNewLocationPage: (BuildContext context) => AddNewLocation(),
    bookingPage: (BuildContext context) => BookingPage(),
    bookingDetails: (BuildContext context) => BookingDetails(),
    paymentMethod: (BuildContext context) => PaymentMethod(),
    forgetPassword: (BuildContext context) => ForgetPassword(),
    otForgetPassword: (BuildContext context) => OtpForgetPasswordScreen(),
    confirmIdentity: (BuildContext context) => ConfirmIdentityPage(),
    sendRequestPage: (BuildContext context) => SendRequestPage(),
    aboutUs: (BuildContext context) => AboutUsWidget(),
    privacy: (BuildContext context) => PrivacyPolicyWidget(),
    homePage: (BuildContext context) => HomePage(),
    allFav: (BuildContext context) => AllFavScreen(),
    dashBoard: (BuildContext context) => DashBoard(),
    logOut: (BuildContext context) => LogOut(text: "text"),
    department: (BuildContext context) => DepartmentScreen(),
    chooseAccount: (BuildContext context) => ChooseAccount(
          width: ScreenSizeUtil.width(context),
        ),
    orderServicesProviderPage: (BuildContext context) =>
        OrderServicesProviderPage(),
    bank: (BuildContext context) => BankPage(),
    addBankAccount: (BuildContext context) => AddNewBankAccount(),
    rootServicesProvider: (BuildContext context) => RootServicesPage(),
    changePasswordInProfile: (BuildContext context) => ChangePassword(),
    departmentDetails: (BuildContext context) => DepartmentDetails(),
    notification: (BuildContext context) => NotificationScreen(),
    editProfile: (BuildContext context) => EditProfilePage(),
    allServices: (BuildContext context) => AllServices(),
    allCategories: (BuildContext context) => AllCategories(),
    allServicesProvider: (BuildContext context) => AllServicesProvider(),
    allAddresses: (BuildContext context) => AllAddresses(),
    paymentRegister: (BuildContext context) => RegisterScreen(),
    webPaymentForm: (BuildContext context) => WebPaymentForm(),
  };
}
