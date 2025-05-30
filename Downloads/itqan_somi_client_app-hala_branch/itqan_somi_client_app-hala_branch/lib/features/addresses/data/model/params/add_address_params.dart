class AddAddressesParams{
  String? title  ;
  String? location;
  String? type;
  String? city;
  String? country;
  String? house;
  String? floor;
  String? longitude;
  String? latitude;
  String? defaultt;

  AddAddressesParams(
      {this.title,
        this.location,
        this.type,
        this.city,
        this.country,
        this.house,
        this.floor,
        this.latitude,
        this.longitude,
        this.defaultt,
      });

  Map<String,dynamic> toJson(){
    return{
      'title':title,
      'location':location,
      'type':type,
      'city':city,
      'country':country,
      'house':house,
      'floor':floor,
      'longitude':longitude,
      'latitude':latitude,
      'default':defaultt,
    };
  }
}