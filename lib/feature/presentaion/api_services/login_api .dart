import 'package:flutter/material.dart';

import 'package:suja_shoie_app/feature/data/core/login_api_client.dart';
import 'package:suja_shoie_app/feature/data/data_source/Remote/login_data_source_impl.dart';
import 'package:suja_shoie_app/feature/data/data_source/Remote/remote_abstract/login_data_source.dart';

import 'package:suja_shoie_app/feature/data/repository/login_repository_imp.dart';
import 'package:suja_shoie_app/feature/domain/entity/loginentity.dart';
import 'package:suja_shoie_app/feature/domain/repository/login_repository.dart';

import '../../domain/usecase/login_usecase.dart';
import '../pages/home_page/main_screen.dart';

class Login_Screen {
  void login({
    required BuildContext context,
    required String loginId,
    required String password,
  }) async {
    try {
      LoginClient apiClient = LoginClient(); // Create an instance of ApiClient
      LoginDataSource loginData = LoginDataSourceimpl(
          apiClient); // Pass the ApiClient instance to ApiService
      LoginRepository loginRepository = LoginRepositoryImpl(loginData);
      ; // Create the LoginRepository implementation
      LoginUseCase loginUseCase =
          LoginUseCase(loginRepository); // Create the use case
      // ignore: unused_local_variable
      loginEntity user = await loginUseCase.execute(loginId, password);

      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const MainScreen(),
        ),
        (route) => false,
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}

void showSnackBar(BuildContext? context, String message) {
  if (context != null) {
    final snackBar = SnackBar(
      backgroundColor: Colors.amber[400],
      content:
          Center(child: Text(message, style: TextStyle(color: Colors.black))),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
