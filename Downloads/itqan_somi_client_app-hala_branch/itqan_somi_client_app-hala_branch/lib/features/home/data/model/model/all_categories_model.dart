class AllCategoriesModel {
  bool? success;
  String? message;
  AllCategories? allCategories;

  AllCategoriesModel({this.success, this.message, this.allCategories});

  AllCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    allCategories = json['all_categories'] != null
        ? new AllCategories.fromJson(json['all_categories'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.allCategories != null) {
      data['all_categories'] = this.allCategories!.toJson();
    }
    return data;
  }
}

class AllCategories {
  int? currentPage;
  List<Data>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  AllCategories(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.path,
        this.perPage,
        this.to,
        this.total});

  AllCategories.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class Data {
  int? id;
  String? parentId;
  String? name;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;
  String? servicesCount;
  List<ActiveChildren>? activeChildren;

  Data(
      {this.id,
        this.parentId,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.servicesCount,
        this.activeChildren});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    servicesCount = json['services_count'];
    if (json['active_children'] != null) {
      activeChildren = <ActiveChildren>[];
      json['active_children'].forEach((v) {
        activeChildren!.add(new ActiveChildren.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['services_count'] = this.servicesCount;
    data['updated_at'] = this.updatedAt;
    if (this.activeChildren != null) {
      data['active_children'] =
          this.activeChildren!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ActiveChildren {
  int? id;
  String? parentId;
  String? name;
  String? image;
  String? status;
  String? createdAt;
  String? updatedAt;

  ActiveChildren(
      {this.id,
        this.parentId,
        this.name,
        this.image,
        this.status,
        this.createdAt,
        this.updatedAt,
     });

  ActiveChildren.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    parentId = json['parent_id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['name'] = this.name;
    data['image'] = this.image;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}