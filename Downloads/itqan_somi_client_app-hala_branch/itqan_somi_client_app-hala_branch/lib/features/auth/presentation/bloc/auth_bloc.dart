import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:client_app/features/auth/data/model/models/register_model.dart';
import 'package:client_app/features/auth/data/model/params/otp_forget_password.dart';
import 'package:client_app/features/auth/data/model/params/otp_params.dart';
import 'package:client_app/features/auth/data/model/params/phone_params.dart';
import 'package:client_app/features/auth/data/model/params/regester_params.dart';
import 'package:client_app/features/auth/data/model/params/reset_password_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../core/common/bloc_status/bloc_status.dart';
import '../../data/model/models/log_in_model.dart';
import '../../data/model/params/image_for_register_param.dart';
import '../../data/model/params/log_in_params.dart';
import '../../data/repo_impl/auth_repo.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepositoryImpl authRepositoryImpl;

  AuthBloc(this.authRepositoryImpl) : super(const AuthState()) {
    on<AuthEvent>(
      (event, emit) async {
        if (event is LoginIn) {
          emit(state.copyWith(logInStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.login(
            loginParams: event.loginParams,
          );
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(state.copyWith(
                logInStatue: BlocStatus.fail(
                  error: fail.message,
                ),
              ));
            },
            (model) {
              emit(state.copyWith(
                logInStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is Register) {
          emit(state.copyWith(registerStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.register(
            registerParams: event.registerParams,
          );
          result.fold(
            (fail) {
              log('Caught register error: ${fail.message}');
              emit(
                state.copyWith(
                  registerStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                registerStatue: BlocStatus.success(
                  model: model,
                ),
              ));
            },
          );
        }
        if (event is Otp) {
          emit(state.copyWith(otpStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.otp(
            otpParams: event.otpParams,
          );
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(
                state.copyWith(
                  otpStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                otpStatue: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
        if (event is Phone) {
          emit(state.copyWith(phoneStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.phone(
            params: event.phoneParams,
          );
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(
                state.copyWith(
                  phoneStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                phoneStatue: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
        if (event is OtpForgetPassword) {
          emit(state.copyWith(otpForgetPasswordStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.otpForgetPassword(
            params: event.otpForgetPasswordParams,
          );
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(
                state.copyWith(
                  otpForgetPasswordStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                otpForgetPasswordStatue: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
        if (event is ResetPasswordEvent) {
          emit(state.copyWith(resetPasswordStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.resetPassword(
            params: event.resetPasswordParams,
          );
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(
                state.copyWith(
                  resetPasswordStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                resetPasswordStatue: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
        if (event is UploadSuccess) {
          emit(state.copyWith(uploadStatue: BlocStatus.loading()));
          final result = await authRepositoryImpl.upload(
            params: event.uploadParams,
          );
          result.fold(
            (fail) {
              log('Caught error: ${fail.message}');
              emit(
                state.copyWith(
                  uploadStatue: BlocStatus.fail(
                    error: fail.message,
                  ),
                ),
              );
            },
            (model) {
              emit(state.copyWith(
                uploadStatue: BlocStatus.success(
                  model: null,
                ),
              ));
            },
          );
        }
      },
    );
  }
}
