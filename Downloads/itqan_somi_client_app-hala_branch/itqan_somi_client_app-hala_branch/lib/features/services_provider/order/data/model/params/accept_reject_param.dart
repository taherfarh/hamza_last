class AcceptRejectParams {
  String? orderId;
  String? action;

  AcceptRejectParams({
    this.orderId,
    this.action,
  });

  Map<String, dynamic> toJson() {
    return {
      'order_id': orderId,
      'action': action,
    };
  }
}
