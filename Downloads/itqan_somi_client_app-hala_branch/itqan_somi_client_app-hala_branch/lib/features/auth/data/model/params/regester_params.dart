class RegisterParams{
  String? fullName ;
  String? email;
  String? phone;
  String? password;
  String? passwordConfirmation;
 String? type;

  RegisterParams(
      {this.phone,
        this.fullName,
        this.email,
        this.type,
        this.passwordConfirmation,
        this.password,
      });

  Map<String,dynamic> toJson(){
    return{
      'full_name':fullName,
      'email':email,
      'phone':phone,
      'password':password,
      'password_confirmation':passwordConfirmation,
      'type':type,
    };
  }
}