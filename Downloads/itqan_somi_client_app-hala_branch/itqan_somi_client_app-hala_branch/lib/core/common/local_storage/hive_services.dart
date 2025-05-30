import 'package:hive/hive.dart';

Future<void> setToken(String? isSavedToken) async {
  var box = Hive.box('authBox');
  await box.put('token', isSavedToken);
}

Future<void> setAppInstall(bool? install) async {
  var box = Hive.box('installBox');
  await box.put('install', install ??false);
}

Future<bool?> getAppInstall() async {
  var box = Hive.box('installBox');
  return box.get('install') ;
}

String? getToken()  {
  var box = Hive.box('authBox');
  return box.get('token') ;
}

Future<void> setType(String? type) async {
  var box = Hive.box('setType');
  await box.put('type', type);
}

String? getType()  {
  var box = Hive.box('setType');
  return box.get('type')  ;
}

Future<void> setGeneral(String key,String? value) async {
  var box = Hive.box('generalBox');
  await box.put(key, value ??false);
}

String? getGeneral(String key)  {
  var box = Hive.box('generalBox');
  return box.get(key) ;
}
