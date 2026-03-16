import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopsphere/core/services/local_storage_service.dart';
import 'package:shopsphere/presentation/widgets/bottom_navbar.dart';

import 'logic/cubits/auth_cubit/auth_cubit.dart';
import 'logic/cubits/product_cubit/product_cubit.dart';
import 'logic/cubits/user_cubit/user_cubit.dart';

import 'presentation/screens/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(create: (context) => AuthCubit()),

        BlocProvider<ProductCubit>(create: (context) => ProductCubit()),

        BlocProvider<UserCubit>(create: (context) => UserCubit()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: LocalStorageService.isLoggedIn(),

          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Scaffold(
                body: Center(child: CircularProgressIndicator()),
              );
            }

            if (snapshot.data == true) {
              return const BottomNavbar();
            }

            return const LoginScreen();
          },
        ),
      ),
    );
  }
}
