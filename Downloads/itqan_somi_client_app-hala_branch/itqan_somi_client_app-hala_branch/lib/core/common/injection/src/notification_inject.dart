

import 'package:client_app/features/notification/data/data_source/remote.dart';
import 'package:client_app/features/notification/data/repo_imp/repo_imp.dart';
import 'package:client_app/features/notification/presentation/state/notification_bloc.dart';

import '../../network/dio/dio.dart';
import '../injection.dart';

Future? notificationInject() {
  locator.registerSingleton(NotificationRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    NotificationImpl(
      networkInfo: locator(),
      remote: locator.get<NotificationRemote>(),
    ),
  );
  locator.registerFactory(
        () => NotificationBloc(
      locator.get<NotificationImpl>(),
    ),
  );
  return null;
}
