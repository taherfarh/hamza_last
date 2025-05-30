import 'package:client_app/core/common/injection/src/addresses_injection.dart';
import 'package:client_app/core/common/injection/src/auth_injection.dart';
import 'package:client_app/core/common/injection/src/cart_injection.dart';
import 'package:client_app/core/common/injection/src/dash_board_injection.dart';
import 'package:client_app/core/common/injection/src/general_injection.dart';
import 'package:client_app/core/common/injection/src/home_injection.dart';
import 'package:client_app/core/common/injection/src/notification_inject.dart';
import 'package:client_app/core/common/injection/src/profile_injection.dart';
import 'package:get_it/get_it.dart';

final locator =GetIt.instance;
Future initInjection() async {
  await generalInject();
  await authInject();
  await homeInject();
  await paymentInject();
  await addressesInject();
  await profileInject();
  await dashBoardInject();
  await notificationInject();
}