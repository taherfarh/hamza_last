import 'package:client_app/profile/data/data_source/remote.dart';
import 'package:client_app/profile/data/repo_imp/repo_imp_profile.dart';
import '../../../../profile/presentation/state/profile_bloc.dart';
import '../../network/dio/dio.dart';
import '../injection.dart';

Future? profileInject() {
  locator.registerSingleton(ProfileRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    RepoImpProfile(
      networkInfo: locator(),
      remote: locator.get<ProfileRemote>(),
    ),
  );
  locator.registerFactory(
    () => ProfileBloc(
      locator.get<RepoImpProfile>(),
    ),
  );
  return null;
}
