class ChangeFcmTokenDashBaordParams{
  String? token ;
  String? userId;

  ChangeFcmTokenDashBaordParams(
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