import 'package:client_app/features/payment/data/data_source/remote.dart';
import 'package:client_app/features/payment/presentation/bloc/payment_bloc.dart';
import '../../../../features/payment/data/repo_impl/repo_imp_payment.dart';
import '../../network/dio/dio.dart';
import '../injection.dart';

Future? paymentInject() {
  locator.registerSingleton(PaymentRemote(dioClient: locator.get<DioClient>()));
  locator.registerSingleton(
    RepoImpPayment(
      networkInfo: locator(),
      remote: locator.get<PaymentRemote>(),
    ),
  );
  locator.registerFactory(() => PaymentBloc(locator.get<RepoImpPayment>()));
  return null;
}
