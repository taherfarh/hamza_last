part of 'dash_borard_bloc.dart';

@immutable
sealed class DashBorardEvent  extends Equatable{}

class ShowOrder extends DashBorardEvent {
  int id;

  ShowOrder({required this.id});

  @override
  List<Object?> get props => [id];
}

class AllOrder extends DashBorardEvent {
  FilterOrderServicesProviderParams filterOrderParams;

  AllOrder({required this.filterOrderParams});

  @override
  List<Object?> get props => [filterOrderParams];
}

class CancelOrder extends DashBorardEvent {
  int id;

  CancelOrder({required this.id});

  @override
  List<Object?> get props => [id];
}
class OrderCountEvent extends DashBorardEvent {

  @override
  List<Object?> get props => [];
}

class AccountBankEvent extends DashBorardEvent {

  @override
  List<Object?> get props => [];
}
class AcceptReject extends DashBorardEvent {
  AcceptRejectParams acceptReject ;

  AcceptReject({required this.acceptReject});

  @override
  List<Object?> get props => [acceptReject];
}

class DeliveryOrder extends DashBorardEvent {
  int id;

  DeliveryOrder({required this.id});

  @override
  List<Object?> get props => [id];
}
class CreateBAnkAccount extends DashBorardEvent {
  CreateAccountBankParams createAccountBankParams;

  CreateBAnkAccount({required this.createAccountBankParams});

  @override
  List<Object?> get props => [createAccountBankParams];
}

class ChangeNotificationEvent extends DashBorardEvent {
  ChangeFcmTokenDashBaordParams changeFcmTokenParams;

  ChangeNotificationEvent({required this.changeFcmTokenParams});

  @override
  List<Object?> get props => [changeFcmTokenParams];
}