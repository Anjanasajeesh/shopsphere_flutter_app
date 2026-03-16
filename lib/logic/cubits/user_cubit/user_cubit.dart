import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:shopsphere/data/models/user_model.dart';

class UserCubit extends Cubit<UserModel?> {
  UserCubit() : super(null);

  Future<void> getUser() async {
    final response = await http.get(
      Uri.parse("https://api.escuelajs.co/api/v1/users/1"),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      emit(UserModel.fromJson(data));
    }
  }
}
