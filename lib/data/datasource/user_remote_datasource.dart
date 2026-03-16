import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shopsphere/core/constants/api_constants.dart';

class UserRemoteDatasource {
  Future<Map<String, dynamic>> getUser() async {
    final response = await http.get(Uri.parse(ApiConstants.user));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    throw Exception("User API error");
  }
}
