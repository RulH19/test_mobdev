import 'package:test_mobdev/data/model/login_model.dart';

class LoginResponse {
  final String expiresOn;
  final String token;
  final LoginModel loginModel;
  final String loginModelId;

  LoginResponse({
    required this.expiresOn,
    required this.token,
    required this.loginModel,
    required this.loginModelId,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      expiresOn: json['expiresOn'],
      token: json['token'],
      loginModel: LoginModel.fromJson(json['user']),
      loginModelId: json['userId'],
    );
  }
}
