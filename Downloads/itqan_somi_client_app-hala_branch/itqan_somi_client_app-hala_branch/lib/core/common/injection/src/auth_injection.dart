import 'package:client_app/features/auth/presentation/bloc/auth_bloc.dart';
import '../../../../features/auth/data/data_source/remote.dart';
import '../../../../features/auth/data/repo_impl/auth_repo.dart';
import '../../network/dio/dio.dart';
import '../injection.dart';

Future? authInject() {
  locator.registerSingleton(AuthRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    AuthRepositoryImpl(
      networkInfo: locator(),
      remote: locator.get<AuthRemote>(),
    ),
  );
  locator.registerFactory(() => AuthBloc(locator.get<AuthRepositoryImpl>()));
  return null;
}
