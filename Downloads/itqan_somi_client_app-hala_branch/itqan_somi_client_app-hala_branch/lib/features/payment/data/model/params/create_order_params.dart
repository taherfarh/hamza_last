class CreateOrderParams {
  String? coupon;
  String? desc;

  CreateOrderParams({
    this.coupon,
    this.desc,
  });

  Map<String, dynamic> toJson() {
    return {
      'coupon': coupon,
      'desc': desc,
    };
  }
}
