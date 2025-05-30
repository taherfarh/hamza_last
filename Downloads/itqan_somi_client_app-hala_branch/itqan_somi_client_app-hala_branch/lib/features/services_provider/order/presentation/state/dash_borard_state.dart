part of 'dash_borard_bloc.dart';

@immutable
class DashBorardState extends Equatable {

  final BlocStatus<FilterServicesProviderOrderModel> allOrderStatus;
  final BlocStatus<Response> cancelOrderStatus;
  final BlocStatus<Response> acceptRejectStatus;
  final BlocStatus<Response> deliveryOrderStatus;
  final BlocStatus<Response> createBankStatus;
  final BlocStatus<ShowOrderServicesProviderModel> showOrderStatus;
  final BlocStatus<OrderCountModel> orderCountStatus;
  final BlocStatus<GetBankModel> getBank;
  final BlocStatus<Response> changeNotificationStatus;

  const DashBorardState({
    this.allOrderStatus = const BlocStatus(),
    this.showOrderStatus = const BlocStatus(),
    this.cancelOrderStatus = const BlocStatus(),
    this.orderCountStatus = const BlocStatus(),
    this.acceptRejectStatus = const BlocStatus(),
    this.deliveryOrderStatus = const BlocStatus(),
    this.getBank = const BlocStatus(),
    this.createBankStatus = const BlocStatus(),
    this.changeNotificationStatus = const BlocStatus(),

  });


  DashBorardState copyWith({
    BlocStatus<FilterServicesProviderOrderModel>? allOrderStatus,
    BlocStatus<Response>? cancelOrderStatus,
    BlocStatus<ShowOrderServicesProviderModel>? showOrderStatus,
    BlocStatus<Response>? acceptRejectStatus,
    BlocStatus<Response>? createBankStatus,
    BlocStatus<OrderCountModel>? orderCountStatus,
    BlocStatus<Response>? deliveryOrderStatus,
    BlocStatus<GetBankModel>? getBank,
    BlocStatus<Response>? changeNotificationStatus,


  }) {
    return DashBorardState(
        allOrderStatus: allOrderStatus ?? this.allOrderStatus,
        showOrderStatus: showOrderStatus ?? this.showOrderStatus,
        cancelOrderStatus: cancelOrderStatus ?? this.cancelOrderStatus,
        orderCountStatus: orderCountStatus ?? this.orderCountStatus,
        createBankStatus: createBankStatus ?? this.createBankStatus,
        acceptRejectStatus: acceptRejectStatus ?? this.acceptRejectStatus,
        deliveryOrderStatus: deliveryOrderStatus ?? this.deliveryOrderStatus,
        getBank: getBank ?? this.getBank,
        changeNotificationStatus:
        changeNotificationStatus ?? this.changeNotificationStatus
    );
  }

  @override
  List<Object?> get props =>
      [
        allOrderStatus,
        showOrderStatus,
        cancelOrderStatus,
        orderCountStatus,
        acceptRejectStatus,
        deliveryOrderStatus,
        getBank,
        createBankStatus,
        changeNotificationStatus
      ];
}

