part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool islogged;
  final String? errorMessage;
  final UserModel? user;

  const AuthState({this.islogged = false, this.errorMessage, this.user});

  AuthState copyWith({bool? islogged, String? errorMessage, UserModel? user}) {
    return AuthState(
      islogged: islogged ?? this.islogged,
      errorMessage: errorMessage ?? this.errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [islogged, errorMessage, user];

  @override
  String toString() {
    return 'AuthState{islogged: $islogged}';
  }
}
