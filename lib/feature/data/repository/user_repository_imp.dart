import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entity/userentity.dart';
import '../../domain/repository/uers_repository.dart';

import '../../presentaion/pages/spalsh_screen.dart';
import '../data_source/Remote/api_service_base.dart';
import '../data_source/remote/login_api_service.dart';

import '../model/usermodel.dart';

class UserRepositoryImpl implements UserRepository {
  final ApiDataSource apiDataSource;

  UserRepositoryImpl(this.apiDataSource);

  @override
  Future<UserModel> signInUser(String email, String password) async {
    UserModel userModel =
        (await apiDataSource.signInUser(email, password)) as UserModel;
    return userModel;
  }

  @override
  Future<UserModel> getUserData(String token) async {
    UserModel userModel = (await apiDataSource.getUserData(token)) as UserModel;
    return userModel;
  }
}
