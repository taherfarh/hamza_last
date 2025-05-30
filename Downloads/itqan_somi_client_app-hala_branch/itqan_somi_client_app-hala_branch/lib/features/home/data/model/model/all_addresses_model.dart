import 'dart:convert';

AllAddressesModel allAddressesModelFromJson(String str) => AllAddressesModel.fromJson(json.decode(str));

String allAddressesModelToJson(AllAddressesModel data) => json.encode(data.toJson());

class AllAddressesModel {
  final bool? success;
  final String? message;
  final Addresses? addresses;

  AllAddressesModel({
    this.success,
    this.message,
    this.addresses,
  });

  factory AllAddressesModel.fromJson(Map<String, dynamic> json) => AllAddressesModel(
    success: json["success"],
    message: json["message"],
    addresses: json["addresses"] == null ? null : Addresses.fromJson(json["addresses"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "addresses": addresses?.toJson(),
  };
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

  factory Addresses.fromJson(Map<String, dynamic> json) => Addresses(
    currentPage: json["current_page"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: json["links"] == null ? [] : List<Link>.from(json["links"]!.map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
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

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    appUserId: json["app_user_id"],
    title: json["title"],
    location: json["location"],
    type: json["type"],
    city: json["city"],
    country: json["country"],
    house: json["house"],
    floor: json["floor"],
    longitude: json["longitude"],
    latitude: json["latitude"],
    datumDefault: json["default"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "app_user_id": appUserId,
    "title": title,
    "location": location,
    "type": type,
    "city": city,
    "country": country,
    "house": house,
    "floor": floor,
    "longitude": longitude,
    "latitude": latitude,
    "default": datumDefault,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };
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

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
