part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthUserLoadingState extends AuthState {}

class AuthUserLoadedState extends AuthState {
  UserModel userModel;
  AuthUserLoadedState({required this.userModel});
}

class AuthUserCreatedState extends AuthState {}

class AuthUserLoginState extends AuthState {}

class AuthUserLogOutState extends AuthState {}

class AuthErrorState extends AuthState {
  String errorMsg;
  AuthErrorState({required this.errorMsg});
}
