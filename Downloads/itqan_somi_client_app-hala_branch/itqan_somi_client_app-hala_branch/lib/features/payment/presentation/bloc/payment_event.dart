part of 'payment_bloc.dart';

@immutable
sealed class PaymentEvent extends Equatable {
  const PaymentEvent();
}

class AllCarts extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

class ShowCart extends PaymentEvent {
  int id;

  ShowCart({required this.id});

  @override
  List<Object?> get props => [id];
}

class DeleteCart extends PaymentEvent {
  int id;

  DeleteCart({required this.id});

  @override
  List<Object?> get props => [id];
}

class ShowOrder extends PaymentEvent {
  int id;

  ShowOrder({required this.id});

  @override
  List<Object?> get props => [id];
}

class AllOrder extends PaymentEvent {
  FilterOrderParams filterOrderParams;

  AllOrder({required this.filterOrderParams});

  @override
  List<Object?> get props => [filterOrderParams];
}

class CreateOrder extends PaymentEvent {
  CreateOrderParams createOrderParams;

  CreateOrder({required this.createOrderParams});

  @override
  List<Object?> get props => [CreateOrder];
}

class CancelOrder extends PaymentEvent {
  int id;

  CancelOrder({required this.id});

  @override
  List<Object?> get props => [id];
}

class AuthPayment extends PaymentEvent {
  @override
  List<Object?> get props => [];
}

class PaymentLinkEvent extends PaymentEvent {
  PaymentParams paymentParams;

  PaymentLinkEvent({required this.paymentParams});

  @override
  List<Object?> get props => [];
}

class SendIdMethodEvent extends PaymentEvent {
  SendIdMethodParams sendIdMethodParams;

  SendIdMethodEvent({required this.sendIdMethodParams});

  @override
  List<Object?> get props => [SendIdMethodEvent];
}

