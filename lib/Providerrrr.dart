import 'package:flutter/material.dart';
import 'package:untitled12/ApiS.dart';
import 'package:untitled12/Data/Products.dart';

class ProductProvider with ChangeNotifier{
  List<Products> _products=[];
  bool _isloading=false;

  bool get isloading=>_isloading;
  ApiService apiService=ApiService();

  List<Products> get products=>_products;
  Future<void>fetchdata() async {
    _isloading=true;
    _products=await apiService.fetchProducts();
    _isloading=false;
    notifyListeners();
  }
}