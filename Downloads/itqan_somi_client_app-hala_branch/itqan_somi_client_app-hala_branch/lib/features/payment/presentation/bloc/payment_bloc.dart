import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client_app/features/payment/data/model/models/auth_payment_model.dart';
import 'package:client_app/features/payment/data/model/models/show_carts_model.dart';
import 'package:client_app/features/payment/data/model/params/create_order_params.dart';
import 'package:client_app/features/payment/data/model/params/payment_params.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/bloc_status/bloc_status.dart';
import '../../data/model/models/all_carts_model.dart';
import '../../../home/data/model/model/count_carts_model.dart';
import '../../data/model/models/filter_order_model.dart';
import '../../data/model/models/payment_link_model.dart';
import '../../data/model/models/show_order_model.dart';
import '../../data/model/params/filter_order_params.dart';
import '../../data/model/params/send_id_method_params.dart';
import '../../data/repo_impl/repo_imp_payment.dart';

part 'payment_event.dart';

part 'payment_state.dart';

class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  RepoImpPayment repoImpPayment ;
  PaymentBloc(this.repoImpPayment) : super(const PaymentState()) {
    on<PaymentEvent>((event, emit) async {
      if (event is AllCarts) {
        emit(state.copyWith(allCartStatue: BlocStatus.loading()));
        final result = await repoImpPayment.getAllCarts();
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              allCartStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              allCartStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is ShowCart) {
        emit(state.copyWith(showCartsStatue: BlocStatus.loading()));
        final result = await repoImpPayment.showCart(id: event.id);
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              showCartsStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              showCartsStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is DeleteCart) {
        emit(state.copyWith(deleteStatue: BlocStatus.loading()));
        final result = await repoImpPayment.deleteCart(id: event.id);
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              deleteStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              deleteStatue: BlocStatus.success(
                model: null,
              ),
            ));
          },
        );
      }
      if (event is AllOrder) {
        emit(state.copyWith(allOrderStatus: BlocStatus.loading()));
        final result = await repoImpPayment.allOrder(filterOrderParams: event.filterOrderParams);
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
      if (event is CreateOrder) {
        emit(state.copyWith(createOrderStatus: BlocStatus.loading()));
        final result = await repoImpPayment.createOrder(createOrderParams: event.createOrderParams);
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              createOrderStatus: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              createOrderStatus: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is ShowOrder) {
        emit(state.copyWith(showOrderStatus: BlocStatus.loading()));
        final result = await repoImpPayment.showOrder(id: event.id);
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
        final result = await repoImpPayment.cancelOrder(id: event.id);
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
      if (event is AuthPayment) {
        emit(state.copyWith(authPaymentStatus: BlocStatus.loading()));
        final result = await repoImpPayment.paymentAuth();
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              authPaymentStatus: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              authPaymentStatus: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is PaymentLinkEvent) {
        emit(state.copyWith(paymentLinkStatus: BlocStatus.loading()));
        final result = await repoImpPayment.paymentLinkModel(paymentParams: event.paymentParams);
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              paymentLinkStatus: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              paymentLinkStatus: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is SendIdMethodEvent) {
        emit(state.copyWith(sendIdMethodEventStatus: BlocStatus.loading()));
        final result = await repoImpPayment.sendIdMethod(sendIdMethodParams: event.sendIdMethodParams);
        result.fold(
              (fail) {
            log('Caught error: ${fail.message}');
            emit(state.copyWith(
              sendIdMethodEventStatus: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              sendIdMethodEventStatus: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
    });
  }
}
