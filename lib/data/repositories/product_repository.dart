import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopsphere/core/constants/api_constants.dart';
import 'package:shopsphere/data/models/product_model.dart';

class ProductRepository {
  Future<List<ProductModel>> fetchProducts() async {
    final response = await http.get(Uri.parse(ApiConstants.products));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      return data.map((e) => ProductModel.fromJson(e)).toList();
    }

    throw Exception("Failed to load products");
  }

  Future<ProductModel> fetchProductDetail(int id) async {
    final response = await http.get(Uri.parse("${ApiConstants.products}/$id"));

    if (response.statusCode == 200) {
      return ProductModel.fromJson(jsonDecode(response.body));
    }

    throw Exception("Failed");
  }
}
