class OrderCountModel {
  bool? success;
  String? message;
  OrdersCount? ordersCount;

  OrderCountModel({this.success, this.message, this.ordersCount});

  OrderCountModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    ordersCount = json['orders_count'] != null
        ? new OrdersCount.fromJson(json['orders_count'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.ordersCount != null) {
      data['orders_count'] = this.ordersCount!.toJson();
    }
    return data;
  }
}

class OrdersCount {
  int? pendingOrders;
  int? acceptedOrders;
  int? rejectedOrders;
  int? deliveredOrders;
  int? canceledOrders;

  OrdersCount(
      {this.pendingOrders,
        this.acceptedOrders,
        this.rejectedOrders,
        this.deliveredOrders,
        this.canceledOrders});

  OrdersCount.fromJson(Map<String, dynamic> json) {
    pendingOrders = json['pending_orders'];
    acceptedOrders = json['accepted_orders'];
    rejectedOrders = json['rejected_orders'];
    deliveredOrders = json['delivered_orders'];
    canceledOrders = json['canceled_orders'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pending_orders'] = this.pendingOrders;
    data['accepted_orders'] = this.acceptedOrders;
    data['rejected_orders'] = this.rejectedOrders;
    data['delivered_orders'] = this.deliveredOrders;
    data['canceled_orders'] = this.canceledOrders;
    return data;
  }
}