class ResetPasswordParams{
  String? phone ;
  String? otp ;
  String? password ;
  String? passwordConfirmation ;

  ResetPasswordParams(
      {this.phone,
        this.otp,
        this.passwordConfirmation,
        this.password
      });

  Map<String,dynamic> toJson(){
    return{
      'phone':phone,
      'otp':otp,
      'password':password,
      'password_confirmation':passwordConfirmation
    };
  }
}