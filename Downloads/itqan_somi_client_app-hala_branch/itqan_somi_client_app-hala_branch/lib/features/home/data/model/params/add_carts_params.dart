class AddCartsParams{
  String? serviceId  ;
  String? addressId;
  String? date;
  String? confirmDelete;
  List<String>? additionIds;

  AddCartsParams(
      {this.serviceId,
        this.addressId,
        this.date,
        this.confirmDelete,
        this.additionIds,
      });

  Map<String,dynamic> toJson(){
    return{
      'service_id':serviceId,
      'address_id':addressId,
      'date':date,
      'confirm_delete':confirmDelete,
      'addition_ids[]' :additionIds
    };
  }
}