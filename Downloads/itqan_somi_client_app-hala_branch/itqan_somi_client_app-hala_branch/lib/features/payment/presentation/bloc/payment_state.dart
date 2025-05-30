part of 'payment_bloc.dart';

@immutable
 class PaymentState extends Equatable {
  final BlocStatus<AllCartsModel> allCartStatue;
  final BlocStatus<ShowCartsModel> showCartsStatue;
  final BlocStatus<Response> deleteStatue;
  final BlocStatus<CountCartsModel> countCartStatue;
  final BlocStatus<FilterOrderModel> allOrderStatus;
  final BlocStatus<Response> createOrderStatus;
  final BlocStatus<Response> sendIdMethodEventStatus;
  final BlocStatus<Response> cancelOrderStatus;
  final BlocStatus<ShowOrderModel> showOrderStatus;
  final BlocStatus<AuthPaymentModel> authPaymentStatus;
  final BlocStatus<PaymentLinkModel> paymentLinkStatus;

   const PaymentState({
    this.allCartStatue = const BlocStatus(),
    this.showCartsStatue = const BlocStatus(),
    this.deleteStatue = const BlocStatus(),
     this.countCartStatue=  const BlocStatus(),
     this.allOrderStatus=  const BlocStatus(),
     this.createOrderStatus=  const BlocStatus(),
     this.sendIdMethodEventStatus=  const BlocStatus(),
     this.showOrderStatus=  const BlocStatus(),
     this.cancelOrderStatus=  const BlocStatus(),
     this.authPaymentStatus=  const BlocStatus(),
     this.paymentLinkStatus=  const BlocStatus(),
  });


  PaymentState copyWith({
    BlocStatus<AllCartsModel>? allCartStatue,
    BlocStatus<ShowCartsModel>? showCartsStatue,
    BlocStatus<Response>? deleteStatue,
    BlocStatus<CountCartsModel>? countCartStatue,
    BlocStatus<FilterOrderModel>? allOrderStatus,
    BlocStatus<Response>? createOrderStatus,
    BlocStatus<ShowOrderModel>? showOrderStatus,
    BlocStatus<Response>? cancelOrderStatus,
    BlocStatus<AuthPaymentModel>? authPaymentStatus,
    BlocStatus<PaymentLinkModel>? paymentLinkStatus,
    BlocStatus<Response>? sendIdMethodEventStatus,


  }) {
    return PaymentState(
      allCartStatue: allCartStatue ?? this.allCartStatue,
      showCartsStatue: showCartsStatue ?? this.showCartsStatue,
      deleteStatue: deleteStatue ?? this.deleteStatue,
      countCartStatue: countCartStatue ?? this.countCartStatue,
      allOrderStatus: allOrderStatus ?? this.allOrderStatus,
      createOrderStatus: createOrderStatus ?? this.createOrderStatus,
      showOrderStatus: showOrderStatus ?? this.showOrderStatus,
      cancelOrderStatus: cancelOrderStatus ?? this.cancelOrderStatus,
      authPaymentStatus: authPaymentStatus ?? this.authPaymentStatus,
      paymentLinkStatus: paymentLinkStatus ?? this.paymentLinkStatus,
      sendIdMethodEventStatus: sendIdMethodEventStatus ?? this.sendIdMethodEventStatus,
    );
  }

  @override
  List<Object?> get props => [
    allCartStatue,
    showCartsStatue,
    deleteStatue,
    countCartStatue,
    allOrderStatus,
    createOrderStatus,
    showOrderStatus,
    cancelOrderStatus,
    authPaymentStatus,
    paymentLinkStatus,
    sendIdMethodEventStatus
  ];
}

