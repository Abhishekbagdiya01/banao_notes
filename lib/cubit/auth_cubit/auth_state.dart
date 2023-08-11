part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthLoadedState extends AuthState {
  UserModel userModel;
  AuthLoadedState({required this.userModel});
}

class AuthErrorState extends AuthState {
  String errorMsg;
  AuthErrorState({required this.errorMsg});
}

class AuthUserCreatedState extends AuthState {}
