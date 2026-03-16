import '../datasource/user_remote_datasource.dart';
import '../models/user_model.dart';

class UserRepository {
  final UserRemoteDatasource datasource = UserRemoteDatasource();

  Future<UserModel> getUser() async {
    final data = await datasource.getUser();

    return UserModel.fromJson(data);
  }
}
