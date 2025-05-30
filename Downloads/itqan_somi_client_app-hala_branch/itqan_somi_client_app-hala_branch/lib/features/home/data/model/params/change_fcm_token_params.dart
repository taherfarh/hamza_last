class ChangeFcmTokenParams{
  String? token ;
  String? userId;

  ChangeFcmTokenParams(
      {this.token,
        this.userId,
      });

  Map<String,dynamic> toJson(){
    return{
      'token':token,
      'user_id':userId,
    };
  }
}