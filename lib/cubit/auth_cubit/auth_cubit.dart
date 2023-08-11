import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/user_model.dart';
import 'package:note_app/repository/user_auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future signUp(
      {required String email,
      required String password,
      required String name}) async {
    try {
      final response = await AuthRepository()
          .createUser(name: name, email: email, password: password);

      if (response == "success") {
        emit(AuthUserCreatedState());
      } else {
        emit(AuthErrorState(errorMsg: response));
      }
    } catch (e) {
      print('error $e');
      emit(AuthErrorState(errorMsg: e.toString()));
    }
  }
}
