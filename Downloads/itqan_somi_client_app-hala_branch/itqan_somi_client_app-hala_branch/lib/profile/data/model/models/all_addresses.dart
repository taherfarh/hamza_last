class AllAddressesModel {
  final bool? success;
  final String? message;
  final Addresses? addresses;

  AllAddressesModel({
    this.success,
    this.message,
    this.addresses,
  });

}

class Addresses {
  final int? currentPage;
  final List<Datum>? data;
  final String? firstPageUrl;
  final int? from;
  final int? lastPage;
  final String? lastPageUrl;
  final List<Link>? links;
  final dynamic nextPageUrl;
  final String? path;
  final int? perPage;
  final dynamic prevPageUrl;
  final int? to;
  final int? total;

  Addresses({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

}

class Datum {
  final int? id;
  final String? appUserId;
  final String? title;
  final String? location;
  final String? type;
  final String? city;
  final String? country;
  final String? house;
  final String? floor;
  final String? longitude;
  final String? latitude;
  final String? datumDefault;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Datum({
    this.id,
    this.appUserId,
    this.title,
    this.location,
    this.type,
    this.city,
    this.country,
    this.house,
    this.floor,
    this.longitude,
    this.latitude,
    this.datumDefault,
    this.createdAt,
    this.updatedAt,
  });

}

class Link {
  final String? url;
  final String? label;
  final bool? active;

  Link({
    this.url,
    this.label,
    this.active,
  });

}
