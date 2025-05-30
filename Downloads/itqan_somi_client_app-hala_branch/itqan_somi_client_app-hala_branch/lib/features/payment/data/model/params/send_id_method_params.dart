class SendIdMethodParams {
  String? paymentId;
  String? paymentMethod;
  int? id;

  SendIdMethodParams({
    this.paymentId,
    this.paymentMethod,
    this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      'payment_id': paymentId,
      'payment_method': paymentMethod,
    };
  }
}
