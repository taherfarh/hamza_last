class FilterParams{
  String? search ;
  String? serviceProviderId;
  String? categoryId;
  String? minPrice;
  String? maxPrice;
  String? rate;

  FilterParams(
      {

        this.search,
        this.serviceProviderId,
        this.categoryId,
        this.maxPrice,
        this.minPrice,
        this.rate,
      });

}