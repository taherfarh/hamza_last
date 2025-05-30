part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent extends Equatable{
  const AuthEvent();

}

class LoginIn extends AuthEvent {
  LoginParams loginParams;

  LoginIn({required this.loginParams});

  @override
  List<Object?> get props => [loginParams];
}
class Register extends AuthEvent {
  RegisterParams registerParams;

  Register({required this.registerParams});

  @override
  List<Object?> get props => [registerParams];
}
class Otp extends AuthEvent {
  OtpParams otpParams;

  Otp({required this.otpParams});

  @override
  List<Object?> get props => [otpParams];
}
class Phone extends AuthEvent {
  PhoneParams phoneParams;

  Phone({required this.phoneParams});

  @override
  List<Object?> get props => [phoneParams];
}
class OtpForgetPassword extends AuthEvent {
  OtpForgetPasswordParams otpForgetPasswordParams;

  OtpForgetPassword({required this.otpForgetPasswordParams});

  @override
  List<Object?> get props => [otpForgetPasswordParams];
}
class ResetPasswordEvent extends AuthEvent {
  ResetPasswordParams resetPasswordParams;

  ResetPasswordEvent({required this.resetPasswordParams});

  @override
  List<Object?> get props => [resetPasswordParams];
}
class UploadSuccess extends AuthEvent {

  UploadParams uploadParams;

  UploadSuccess({required this.uploadParams});

  @override
  List<Object?> get props => [uploadParams];
}