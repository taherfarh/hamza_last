import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier{
  String? provideServicesId  ;
  String? categoriesId  ;
  String? price  ;
  String? rate  ;
  List<String>? additionId  ;


  Future<void> setProvideServicesId(String id) async {
    provideServicesId = id;
    notifyListeners();
  }
  Future<void> setCategoriesId(String id) async {
    categoriesId = id;
    notifyListeners();
  }
  Future<void> setPrice(String id) async {
    price = id;
    notifyListeners();
  }
  Future<void> setRate(String id) async {
    rate = id;
    notifyListeners();
  }
  Future<void> setAddition(List<String> additionIds) async {
    additionId = additionIds;
    notifyListeners();
  }

}