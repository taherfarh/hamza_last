import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../../../../core/common/bloc_status/bloc_status.dart';
import '../../../../home/data/model/params/change_fcm_token_params.dart';
import '../../data/model/models/filter_all_order_services_provider_model.dart';
import '../../data/model/models/get_bank_model.dart';
import '../../data/model/models/order_count_model.dart';
import '../../data/model/models/show_order_services_provider.dart';
import '../../data/model/params/accept_reject_param.dart';
import '../../data/model/params/bank_account_param.dart';
import '../../data/model/params/change_fcm_token_dashBoard_params.dart';
import '../../data/model/params/filter_order_params.dart';
import '../../data/repo_impl/repo_imp_dashboard.dart';

part 'dash_borard_event.dart';

part 'dash_borard_state.dart';

class DashBorardBloc extends Bloc<DashBorardEvent, DashBorardState> {
  RepoImpDashBoard repoImpDashBoard;

  DashBorardBloc(this.repoImpDashBoard) : super(DashBorardState()) {
    on<DashBorardEvent>(
      (event, emit) async {
        if (event is ShowOrder) {
          emit(state.copyWith(showOrderStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.showOrder(id: event.id);
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                showOrderStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                showOrderStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is CancelOrder) {
          emit(state.copyWith(cancelOrderStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.cancelOrder(id: event.id);
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                cancelOrderStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                cancelOrderStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is AllOrder) {
          emit(state.copyWith(allOrderStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.allOrder(
              filterOrderParams: event.filterOrderParams);
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                allOrderStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                allOrderStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is OrderCountEvent) {
          emit(state.copyWith(orderCountStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.orderCount();
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                orderCountStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                orderCountStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is AcceptReject) {
          emit(state.copyWith(acceptRejectStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.acceptReject(
              acceptReject: event.acceptReject);
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                acceptRejectStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                acceptRejectStatus: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
        if (event is DeliveryOrder) {
          emit(state.copyWith(deliveryOrderStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.deliveryOrder(id: event.id);
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                deliveryOrderStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                deliveryOrderStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is AccountBankEvent) {
          emit(state.copyWith(getBank: BlocStatus.loading()));
          final result = await repoImpDashBoard.getAllBank();
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                getBank: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                getBank: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is CreateBAnkAccount) {
          emit(state.copyWith(createBankStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.createBankAccount(
              params: event.createAccountBankParams);
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                createBankStatus: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                createBankStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is ChangeNotificationEvent) {
          emit(state.copyWith(changeNotificationStatus: BlocStatus.loading()));
          final result = await repoImpDashBoard.changeNotification(
              changeFcmParams: event.changeFcmTokenParams);
          result.fold(
                (fail) {
              print(fail);
              emit(
                state.copyWith(
                  changeNotificationStatus: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
                (model) {
              emit(state.copyWith(
                changeNotificationStatus: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }

      },
    );
  }
}
