import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:note_app/presentation/screens/add_note_page.dart';
import 'package:note_app/presentation/screens/user_onboarding/sign_up_page.dart';
import 'package:note_app/presentation/widgets/snackbar.dart';
import 'package:note_app/utils/const.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Greeting,",
                        style: TextStyle(fontSize: 21, color: whiteColor),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "UserName",
                        style:
                            TextStyle(fontSize: 25, color: Colors.amberAccent),
                      ),
                    )
                  ],
                ),
                BlocListener<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is AuthUserLogOutState) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpScreen(),
                          ));
                      snackbarMessenger(context,
                          "You're now logged out. We're grateful for your time. Until we meet again!");
                    } else if (state is AuthErrorState) {
                      snackbarMessenger(context, state.errorMsg);
                    }
                  },
                  child: IconButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).logOut();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: whiteColor,
                      )),
                )
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNoteScreen(),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
