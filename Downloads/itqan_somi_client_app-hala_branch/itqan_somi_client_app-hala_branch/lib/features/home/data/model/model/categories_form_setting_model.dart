// To parse this JSON data, do
//
//     final categoriesFormSettingModel = categoriesFormSettingModelFromJson(jsonString);

import 'dart:convert';

CategoriesFormSettingModel categoriesFormSettingModelFromJson(String str) => CategoriesFormSettingModel.fromJson(json.decode(str));

String categoriesFormSettingModelToJson(CategoriesFormSettingModel data) => json.encode(data.toJson());

class CategoriesFormSettingModel {
  final bool? success;
  final String? message;
  final Category? category;
  final List<Category>? activeChildCategories;

  CategoriesFormSettingModel({
    this.success,
    this.message,
    this.category,
    this.activeChildCategories,
  });

  factory CategoriesFormSettingModel.fromJson(Map<String, dynamic> json) => CategoriesFormSettingModel(
    success: json["success"],
    message: json["message"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    activeChildCategories: json["active_child_categories"] == null ? [] : List<Category>.from(json["active_child_categories"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "category": category?.toJson(),
    "active_child_categories": activeChildCategories == null ? [] : List<dynamic>.from(activeChildCategories!.map((x) => x.toJson())),
  };
}

class Category {
  final int? id;
  final String? parentId;
  final String? name;
  final String? image;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Category>? children;
  final List<Category>? activeChildren;

  Category({
    this.id,
    this.parentId,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.children,
    this.activeChildren,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    parentId: json["parent_id"],
    name: json["name"],
    image: json["image"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    children: json["children"] == null ? [] : List<Category>.from(json["children"]!.map((x) => Category.fromJson(x))),
    activeChildren: json["active_children"] == null ? [] : List<Category>.from(json["active_children"]!.map((x) => Category.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "parent_id": parentId,
    "name": name,
    "image": image,
    "status": status,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "children": children == null ? [] : List<dynamic>.from(children!.map((x) => x.toJson())),
    "active_children": activeChildren == null ? [] : List<dynamic>.from(activeChildren!.map((x) => x.toJson())),
  };
}
