part of 'addresses_bloc.dart';

@immutable
sealed class AddressesEvent  extends Equatable{
  const AddressesEvent();
}

class AddAddresses extends AddressesEvent {
  AddAddressesParams addAddressesParams;

  AddAddresses( {required  this.addAddressesParams});

  @override
  List<Object?> get props => [addAddressesParams];
}
class EditAddresses extends AddressesEvent {
  AddAddressesParams addAddressesParams;
int id;
  EditAddresses( {required  this.addAddressesParams,required this.id});

  @override
  List<Object?> get props => [addAddressesParams,id];
}
