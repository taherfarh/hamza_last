class PhoneParams{
  String? phone ;

  PhoneParams(
      {this.phone,
      });

  Map<String,dynamic> toJson(){
    return{
      'phone':phone,
    };
  }
}