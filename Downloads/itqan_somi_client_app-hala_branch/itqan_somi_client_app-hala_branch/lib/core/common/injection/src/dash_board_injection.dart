import '../../../../features/services_provider/order/data/data_source/remote.dart';
import '../../../../features/services_provider/order/data/repo_impl/repo_imp_dashboard.dart';
import '../../../../features/services_provider/order/presentation/state/dash_borard_bloc.dart';
import '../../network/dio/dio.dart';
import '../injection.dart';

Future? dashBoardInject() {
  locator.registerSingleton(
      ServicesProviderRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    RepoImpDashBoard(
      networkInfo: locator(),
      remote: locator.get<ServicesProviderRemote>(),
    ),
  );
  locator.registerFactory(
    () => DashBorardBloc(
      locator.get<RepoImpDashBoard>(),
    ),
  );
  return null;
}
