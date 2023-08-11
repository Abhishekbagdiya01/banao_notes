part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthUserCreatedState extends AuthState {}

class AuthUserLoginState extends AuthState {}

class AuthErrorState extends AuthState {
  String errorMsg;
  AuthErrorState({required this.errorMsg});
}
