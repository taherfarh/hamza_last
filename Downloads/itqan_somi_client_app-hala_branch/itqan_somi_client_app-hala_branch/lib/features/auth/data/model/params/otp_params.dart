
class OtpParams{
  String? phone ;
  String? password;
  String? otp;

  OtpParams(
      {this.phone,
        this.password,
        this.otp,
      });

  Map<String,dynamic> toJson(){
    return{
      'phone':phone,
      'password':password,
      'otp':otp,
    };
  }
}