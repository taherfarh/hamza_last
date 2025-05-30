import 'package:client_app/features/home/data/data_source/remote.dart';
import 'package:client_app/features/home/data/repo_imp/home_repo.dart';
import 'package:client_app/features/home/presentation/bloc/home_bloc.dart';

import '../../../../features/auth/data/repo_impl/auth_repo.dart';
import '../../network/dio/dio.dart';
import '../injection.dart';

Future? homeInject() {
  locator.registerSingleton(HomeRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    HomeRepositoryImpl(
      networkInfo: locator(),
      remote: locator.get<HomeRemote>(),
    ),
  );
  locator.registerFactory(
    () => HomeBloc(
      locator.get<HomeRepositoryImpl>(),
    ),
  );
  return null;
}
