part of 'auth_bloc.dart';

@immutable
 class AuthState  extends Equatable{
  final BlocStatus<LogInModel> logInStatue;
  final BlocStatus<RegisterModel> registerStatue;
  final BlocStatus<Response> otpStatue;
  final BlocStatus<Response> phoneStatue;
  final BlocStatus<Response> otpForgetPasswordStatue;
  final BlocStatus<Response> resetPasswordStatue;
  final BlocStatus<Response> uploadStatue;


  const AuthState({
    this.logInStatue = const BlocStatus(),
    this.registerStatue = const BlocStatus(),
    this.otpStatue = const BlocStatus(),
    this.phoneStatue = const BlocStatus(),
    this.otpForgetPasswordStatue = const BlocStatus(),
    this.resetPasswordStatue = const BlocStatus(),
    this.uploadStatue = const BlocStatus(),
  });

  AuthState copyWith({
    BlocStatus<LogInModel>? logInStatue,
     BlocStatus<RegisterModel>? registerStatue,
     BlocStatus<Response>? otpStatue,
     BlocStatus<Response>? phoneStatue,
     BlocStatus<Response>? otpForgetPasswordStatue,
     BlocStatus<Response>? resetPasswordStatue,
     BlocStatus<Response>? uploadStatue,

  }) {
    return AuthState(
      logInStatue: logInStatue ?? this.logInStatue,
      registerStatue: registerStatue ?? this.registerStatue,
      otpStatue: otpStatue ?? this.otpStatue,
      phoneStatue: phoneStatue ?? this.phoneStatue,
      otpForgetPasswordStatue: otpForgetPasswordStatue ?? this.otpForgetPasswordStatue,
resetPasswordStatue: resetPasswordStatue ?? this.resetPasswordStatue,
      uploadStatue: uploadStatue ?? this.uploadStatue,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    logInStatue,
    registerStatue,
    otpStatue,
    phoneStatue,
    otpForgetPasswordStatue,
    resetPasswordStatue,
    uploadStatue
  ];

}

