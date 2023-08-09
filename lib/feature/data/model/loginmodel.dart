import 'package:suja_shoie_app/feature/domain/entity/loginentity.dart';
import 'package:suja_shoie_app/feature/domain/entity/userentity.dart';

class LoginModel extends loginEntity {
  LoginModel(
      {String? loginId,
      String? password,
      String? personFname,
      String? deptName,
      String? personLname,
      String? orgName,
      String? permissionRole,
      String? orgLogo,
      String? clientauthToken})
      : super(
          loginId: loginId,
          password: password,
          personFname: personFname,
          deptName: deptName,
          personLname: personLname,
          orgName: orgName,
          permissionRole: permissionRole,
          orgLogo: orgLogo,
          clientauthToken: clientauthToken,
        );

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
        loginId: json['login_id'],
        password: json['password'],
        personFname: json['person_fname'],
        deptName: json['dept_name'],
        personLname: json['person_lname'],
        orgName: json['org_name'],
        permissionRole: json['permission_role'],
        orgLogo: json['org_logo'],
        clientauthToken: json['client_aut_token']);
  }

  Map<String, dynamic> toJson() {
    return {
      'login_id': loginId,
      'password': password,
      'person_fname': personFname,
      'dept_name': deptName,
      'person_lname': personLname,
      'org_name': orgName,
      'permission_role': permissionRole,
      'org_logo': orgLogo,
      'client_aut_token': clientauthToken,
    };
  }
}
