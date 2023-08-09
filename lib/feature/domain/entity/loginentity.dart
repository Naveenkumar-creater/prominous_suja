// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class loginEntity extends Equatable {
  final String? loginId;
  final String? password;
  final String? personFname;
  final String? deptName;
  final String? personLname;
  final String? orgName;
  final String? permissionRole;
  final String? orgLogo;
  final String? clientauthToken;

  loginEntity({
    this.clientauthToken,
    this.loginId,
    this.password,
    this.personFname,
    this.deptName,
    this.personLname,
    this.orgName,
    this.permissionRole,
    this.orgLogo,
  });

  @override
  // TODO: implement props
  List<Object?> get props {
    return [
      loginId,
      password,
      personFname,
      deptName,
      personLname,
      orgName,
      orgLogo,
      permissionRole
    ];
  }
}
