import 'package:bloc/bloc.dart';
import 'package:client_app/features/addresses/data/model/params/add_address_params.dart';
import 'package:client_app/features/addresses/data/repo_imp/addresses_imp.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/bloc_status/bloc_status.dart';

part 'addresses_event.dart';
part 'addresses_state.dart';

class AddressesBloc extends Bloc<AddressesEvent, AddressesState> {
  AddressesImp addressesImp ;


  AddressesBloc(this.addressesImp) : super(AddressesState()) {
    on<AddressesEvent>((event, emit) async {
      if (event is AddAddresses) {
        emit(state.copyWith(createAddressesStatue: BlocStatus.loading()));
        final result = await addressesImp.addAddresses(addAddressesParams: event.addAddressesParams);
        result.fold(
              (fail) {
            emit(state.copyWith(
              createAddressesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              createAddressesStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }
      if (event is EditAddresses) {
        emit(state.copyWith(editAddressesStatue: BlocStatus.loading()));
        final result = await addressesImp.editAddresses(addAddressesParams: event.addAddressesParams,id: event.id);
        result.fold(
              (fail) {
            emit(state.copyWith(
              editAddressesStatue: BlocStatus.fail(
                error: fail.message,
              ),
            ));
          },
              (model) {
            emit(state.copyWith(
              editAddressesStatue: BlocStatus.success(
                model: model,
              ),
            ));
          },
        );
      }

    });
  }
}
