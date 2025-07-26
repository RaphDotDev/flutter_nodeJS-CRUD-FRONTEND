import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ui/model/product_model.dart';

class Api {
  static const baseUrl = 'http://192.168.100.199/api/';

//Create Product
  static Future<void> addProduct(Map pdata) async {
    late final Dio _dio = Dio();
    try {
      final response = await _dio.post("${baseUrl}add_product", data: pdata);

      if (response.statusCode == 200) {
        var data = response.data;
        debugPrint("Final Product Data: $data");
      } else {
        debugPrint("Failed to get response");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  static Future<List<Product>> getProduct() async {
    final Dio _dio = Dio();

    List<Product> products = [];

    try {
      final response = await _dio.get("${baseUrl}get_product");

     if (response.statusCode == 200) {
      var data = response.data;
      debugPrint("All Products: $data");

      for (var e in data) {
        products.add(Product(
          name: e['pname'],
          price: e['pprice'].toString(),
          desc: e['pdesc'],
          id: e['_id'].toString(),
        ));
      }

      return products;
    } else {
        return [];
      }
    } catch (e) {
      debugPrint("Error in $e");
    }
    return [];
  }

  static updateProduct(id, body) async {
    final Dio _dio = Dio();
    try {
      final response = await _dio.put("${baseUrl}update/$id", data: body);

      if (response.statusCode == 200) {
        print("Data Updated: ${response.data}");
      } else {
        print("Failed to update data");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  static deleeteProduct(id) async {
    final Dio _dio = Dio();
    try {
      final response = await _dio.post("${baseUrl}delete/$id");

      if (response.statusCode == 204) {
        print("Deleted: ${response.data}");
      } else {
        print("unsuccessfully deleted");
      }
    } catch (e) {
      debugPrint("Error: $e");
    }
  }
}
