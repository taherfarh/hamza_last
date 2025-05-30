class FilterOrderParams {
  String? status;

  FilterOrderParams({
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }
}
