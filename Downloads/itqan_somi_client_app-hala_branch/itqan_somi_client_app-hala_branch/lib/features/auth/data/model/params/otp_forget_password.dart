class OtpForgetPasswordParams{
  String? phone ;
  String? otp;

  OtpForgetPasswordParams(
      {this.phone,
        this.otp,
      });

  Map<String,dynamic> toJson(){
    return{
      'phone':phone,
      'otp':otp,
    };
  }
}