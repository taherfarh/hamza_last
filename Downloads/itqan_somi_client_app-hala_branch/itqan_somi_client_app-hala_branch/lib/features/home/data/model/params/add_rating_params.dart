class AddRatingParams {
  String? serviceId;

  String? comment;

  String? rate;

  AddRatingParams({
    this.serviceId,
    this.rate,
    this.comment,
  });

  Map<String, dynamic> toJson() {
    return {
      'service_id': serviceId,
      'comment': comment,
      'rate': rate,
    };
  }
}
