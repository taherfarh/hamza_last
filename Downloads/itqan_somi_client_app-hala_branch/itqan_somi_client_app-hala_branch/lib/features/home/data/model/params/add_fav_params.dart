class AddFavParams{
  String? serviceId  ;

  AddFavParams(
      {this.serviceId,
      });

  Map<String,dynamic> toJson(){
    return{
      'service_id':serviceId,
    };
  }
}