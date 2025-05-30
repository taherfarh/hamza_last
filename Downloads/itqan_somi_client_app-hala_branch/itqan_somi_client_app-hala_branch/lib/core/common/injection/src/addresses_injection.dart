import '../../../../features/addresses/data/data_source/remote.dart';
import '../../../../features/addresses/data/repo_imp/addresses_imp.dart';
import '../../../../features/addresses/presentation/state/addresses_bloc.dart';
import '../../network/dio/dio.dart';
import '../injection.dart';

Future? addressesInject() {
  locator.registerSingleton(AddressesRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    AddressesImp(
      networkInfo: locator(),
      remote: locator.get<AddressesRemote>(),
    ),
  );
  locator.registerFactory(() => AddressesBloc(locator.get<AddressesImp>()));
  return null;
}
