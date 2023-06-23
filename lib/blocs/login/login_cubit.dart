import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:test_project/services/api_service.dart';

export 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final ApiService _apiService = ApiService();
  LoginCubit() : super(LoginInitial());
  void passwordIsHidden() {
    if (state is LoginPasswordIsHidden) {
      final currentState = state as LoginPasswordIsHidden;
      emit(
        LoginPasswordIsHidden(isHidden: !currentState.isHidden),
      );
    } else {
      emit(
        LoginPasswordIsHidden(isHidden: true),
      );
    }
  }

  void login(String username, String password) async {
    try {
      emit(LoginLoading());
      await _apiService.post(
        endpoint: 'auth/login',
        body: {
          'email': username,
          'password': password,
        },
      );
      emit(LoginSuccess());
    } catch (e) {
      emit(
        LoginError(
          message: e.toString(),
        ),
      );
    }
  }
}
