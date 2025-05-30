class FilterOrderServicesProviderParams {
  String? status;

  FilterOrderServicesProviderParams({
    this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'status': status,
    };
  }
}
