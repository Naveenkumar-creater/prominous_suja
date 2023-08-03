import 'package:suja_shoie_app/feature/data/data_source/Remote/remote_abstract/login_data_source.dart';
import 'package:suja_shoie_app/feature/data/model/loginmodel.dart';
import 'package:suja_shoie_app/feature/domain/entity/loginentity.dart';
import 'package:suja_shoie_app/feature/domain/repository/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDataSource loginDataSource;

  LoginRepositoryImpl(this.loginDataSource);

  @override
  Future<loginEntity> loginInUser(String loginId, String password) async {
    LoginModel loginModel =
        await loginDataSource.loginInUser(loginId, password);
    return loginModel;
  }
}
