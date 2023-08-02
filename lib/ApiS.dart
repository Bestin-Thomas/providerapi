import 'dart:convert';
import 'package:untitled12/Data/Products.dart';
import 'package:http/http.dart' as http;
import 'package:untitled12/Data/Resp.dart';

class ApiService{
  Future<List<Products>> fetchProducts() async {
    final response= await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode==200){
      final resp=json.decode(response.body);
      var  data=Resp.fromJson(resp);
      var plist=data.products;
      return plist;
    }
    else{
      throw Exception('Failed to load');
    }
  }
}