import 'package:shared_preferences/shared_preferences.dart';
import '../../network/dio/dio.dart';
import '../../network/dio/dio_factory.dart';
import '../../network/network_info.dart';
import '../injection.dart';

class Instance {
  static SharedPreferences? _instance;

  static Future<SharedPreferences> instance() async {
    if (_instance != null) {
      return _instance!;
    } else {
      return await SharedPreferences.getInstance();
    }
  }
}

Future? generalInject() async {
  locator.registerSingleton<SharedPreferences>(await Instance.instance());

  //NetworkInfo instance
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // print("${GetIt.I.isRegistered<NetworkInfo>()} " + "NetworkInfo");

  //DioFactory instance
  locator.registerLazySingleton<DioFactory>(
    () => DioFactory(),
  );
  final dio = await locator<DioFactory>().getDio();

  //AppServiceClient instance
  locator.registerLazySingleton(() => DioClient(dio));

  return null;
}
