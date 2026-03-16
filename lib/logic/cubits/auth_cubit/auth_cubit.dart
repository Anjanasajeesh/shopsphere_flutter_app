import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/services/local_storage_service.dart';

class AuthCubit extends Cubit<bool> {
  AuthCubit() : super(false);

  void checkLogin() async {
    final logged = await LocalStorageService.isLoggedIn();

    emit(logged);
  }

  void login() async {
    await LocalStorageService.saveLogin();

    emit(true);
  }

  void logout() async {
    await LocalStorageService.logout();

    emit(false);
  }
}
