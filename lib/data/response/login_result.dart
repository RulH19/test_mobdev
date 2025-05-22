import 'package:test_mobdev/data/response/login_response.dart';

class LoginResult {
  final bool isSuccess;
  final LoginResponse? data;
  final String? error;

  LoginResult._({required this.isSuccess, this.data, this.error});

  factory LoginResult.success(LoginResponse data) {
    return LoginResult._(isSuccess: true, data: data);
  }

  factory LoginResult.failure(String error) {
    return LoginResult._(isSuccess: false, error: error);
  }
}
