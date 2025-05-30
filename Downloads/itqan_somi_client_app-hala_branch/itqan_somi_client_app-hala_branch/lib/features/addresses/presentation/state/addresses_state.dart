part of 'addresses_bloc.dart';

@immutable
class AddressesState extends Equatable {
  final BlocStatus<Response> createAddressesStatue;
  final BlocStatus<Response> editAddressesStatue;

  const AddressesState({
    this.createAddressesStatue = const BlocStatus(),
    this.editAddressesStatue = const BlocStatus(),
  });

  AddressesState copyWith({
    BlocStatus<Response>? createAddressesStatue,
    BlocStatus<Response>? editAddressesStatue,
  }) {
    return AddressesState(
        createAddressesStatue:
            createAddressesStatue ?? this.createAddressesStatue,
        editAddressesStatue: editAddressesStatue ?? this.editAddressesStatue);
  }

  @override
  List<Object?> get props => [
        createAddressesStatue,
        editAddressesStatue,
      ];
}
