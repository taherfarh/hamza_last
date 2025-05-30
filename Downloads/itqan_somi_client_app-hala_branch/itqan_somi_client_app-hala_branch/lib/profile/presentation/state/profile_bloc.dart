import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meta/meta.dart';
import '../../../core/common/bloc_status/bloc_status.dart';
import '../../../features/home/data/model/model/all_addresses_model.dart';
import '../../data/model/models/about_us_model.dart';
import '../../data/model/models/edit_profile_model.dart';
import '../../data/model/models/our_message_model.dart';
import '../../data/model/models/our_vession_model.dart';
import '../../data/model/models/privacy_policy.dart';
import '../../data/model/params/change_password_profile_param.dart';
import '../../data/model/params/profile_setting_params.dart';
import '../../data/repo_imp/repo_imp_profile.dart';

part 'profile_event.dart';

part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  RepoImpProfile repoImpProfile;

  ProfileBloc(this.repoImpProfile) : super(const ProfileState()) {
    on<ProfileEvent>(
      (event, emit) async {
        if (event is AboutUs) {
          emit(state.copyWith(aboutUsStatue: BlocStatus.loading()));
          final result = await repoImpProfile.aboutUs();
          result.fold(
            (fail) {
              emit(state.copyWith(
                aboutUsStatue: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                aboutUsStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is OurVision) {
          emit(state.copyWith(ouVisionStatue: BlocStatus.loading()));
          final result = await repoImpProfile.ourVision();
          result.fold(
            (fail) {
              emit(state.copyWith(
                ouVisionStatue: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                ouVisionStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is OurMessage) {
          emit(state.copyWith(ouMessageStatue: BlocStatus.loading()));
          final result = await repoImpProfile.ourMessage();
          result.fold(
            (fail) {
              emit(state.copyWith(
                ouMessageStatue: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                ouMessageStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is Privacy) {
          emit(state.copyWith(privacyStatue: BlocStatus.loading()));
          final result = await repoImpProfile.privacy();
          result.fold(
            (fail) {
              emit(state.copyWith(
                privacyStatue: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                privacyStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is ChangePasswordProfile) {
          emit(state.copyWith(
              changePasswordProfileStatue: BlocStatus.loading()));
          final result = await repoImpProfile.changePasswordProfile(
              changePassword: event.changePasswordProfileParams);
          result.fold(
            (fail) {
              emit(
                state.copyWith(
                  changePasswordProfileStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                changePasswordProfileStatue: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
        if (event is EditProfile) {
          emit(state.copyWith(editProfileStatue: BlocStatus.loading()));
          final result = await repoImpProfile.editProfile(
              profileSetting: event.profileSettingParams);
          result.fold(
            (fail) {
              emit(
                state.copyWith(
                  editProfileStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                editProfileStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is AllAddressesEvent) {
          emit(state.copyWith(editProfileStatue: BlocStatus.loading()));
          final result = await repoImpProfile.allAddresses();
          result.fold(
            (fail) {
              emit(
                state.copyWith(
                  allAddressesStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                allAddressesStatue: BlocStatus.success(
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
