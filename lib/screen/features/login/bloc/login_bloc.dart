import 'package:bloc/bloc.dart';
import 'package:test_mobdev/data/api/api_service.dart';
import 'package:test_mobdev/screen/features/login/bloc/login_event.dart';
import 'package:test_mobdev/screen/features/login/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiService apiService;

  LoginBloc(this.apiService) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginPressed);
  }

  Future<void> _onLoginPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await apiService.loginUser(event.email, event.password);
      if (response.isSuccess) {
        emit(LoginSuccess(response.data!));
      } else {
        emit(LoginFailure(response.error ?? "Login gagal"));
      }
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
