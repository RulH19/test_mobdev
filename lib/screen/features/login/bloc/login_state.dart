import 'package:equatable/equatable.dart';
import 'package:test_mobdev/data/response/login_response.dart';

abstract class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final LoginResponse data;

  LoginSuccess(this.data);

  @override
  List<Object?> get props => [data];
}

class LoginFailure extends LoginState {
  final String message;

  LoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}
