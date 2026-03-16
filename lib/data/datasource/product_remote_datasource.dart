import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopsphere/core/constants/api_constants.dart';

class ProductRemoteDataSource {
  Future<List> getProducts() async {
    final response = await http.get(Uri.parse(ApiConstants.products));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception("API Error");
  }

  Future<Map<String, dynamic>> getProductDetail(int id) async {
    final response = await http.get(Uri.parse("${ApiConstants.products}/$id"));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception("API Error");
  }
}
