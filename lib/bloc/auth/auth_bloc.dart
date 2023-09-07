import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obankroot/models/user_model.dart';
import 'package:obankroot/services/auth_service.dart';
import 'package:obankroot/services/user_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<LoginEvent>((event, emit) async {
      try {
        await AuthService().login(email: event.email, password: event.password);

        UserModel test = await UserService().getUser();

        emit(state.copyWith(islogged: true, errorMessage: null, user: test));
      } catch (e) {
        emit(state.copyWith(
            islogged: false, errorMessage: "Invalid credentials"));
      }
    });

    on<LogoutEvent>((event, emit) {
      AuthService().logout();
      emit(state.copyWith(islogged: false, user: null));
    });
  }
}
