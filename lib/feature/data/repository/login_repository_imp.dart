import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suja_shoie_app/feature/data/data_source/Remote/login_service.dart';
import 'package:suja_shoie_app/feature/data/model/loginmodel.dart';
import 'package:suja_shoie_app/feature/domain/entity/loginentity.dart';
import 'package:suja_shoie_app/feature/domain/repository/login_repository.dart';
import '../../domain/entity/userentity.dart';
import '../../domain/repository/uers_repository.dart';

import '../../presentaion/pages/spalsh_screen.dart';
import '../data_source/remote/login_api_service.dart';

import '../model/usermodel.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService loginService;

  LoginRepositoryImpl(this.loginService);

  @override
  Future<loginEntity> loginInUser(String loginId, String password) async {
    LoginModel loginModel =
        (await loginService.loginInUser(loginId, password)) as LoginModel;
    return loginModel;
  }
}
