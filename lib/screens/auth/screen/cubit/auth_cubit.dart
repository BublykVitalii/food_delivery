import 'package:get_it/get_it.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_delivery/screens/auth/domain/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  AuthService get authService => GetIt.instance.get<AuthService>();

  Future<void> authorizationUser(String username, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await authService.authorizationUser(username, password);
      emit(state.copyWith(status: AuthStatus.success));
    } catch (error) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }

  Future<void> registerAUsers(
      String username, String email, String password) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      await authService.registerAUsers(username, email, password);
      emit(state.copyWith(status: AuthStatus.success));
    } catch (error) {
      emit(state.copyWith(
        status: AuthStatus.error,
        errorMessage: error.toString(),
      ));
    }
  }
}
