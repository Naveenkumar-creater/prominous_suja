import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suja_shoie_app/feature/data/data_source/Remote/login_service.dart';
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
      LoginRepository userRepository = LoginRepositoryImpl(
          LoginService()); // Create the LoginRepository implementation
      LoginUseCase loginUseCase =
          LoginUseCase(userRepository); // Create the use case
      // ignore: unused_local_variable
      loginEntity user = await loginUseCase.execute(loginId, password);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => MainScreen(),
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
