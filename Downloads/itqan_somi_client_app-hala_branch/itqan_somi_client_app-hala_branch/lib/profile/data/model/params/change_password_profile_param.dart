class ChangePasswordProfileParams {
  String? oldPassword;
  String? password;
  String? passwordConfirmation;

  ChangePasswordProfileParams({
    this.oldPassword,
    this.password,
    this.passwordConfirmation,
  });

  Map<String, dynamic> toJson() {
    return {
      'old_password': oldPassword,
      'password': password,
      'password_confirmation': passwordConfirmation,
    };
  }
}
