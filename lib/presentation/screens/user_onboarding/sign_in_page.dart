import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubit/auth_cubit/auth_cubit.dart';
import 'package:note_app/presentation/screens/user_onboarding/sign_up_page.dart';

import '../../widgets/input_field.dart';
import '../../widgets/snackbar.dart';
import '../home_page.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Login',
                style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple),
              ),
              InputField(
                controller: emailController,
                color: Colors.grey,
                hintText: "Email",
                icon: Icons.email,
              ),
              InputField(
                controller: passwordController,
                obscureText: isVisible ? false : true,
                suffixIcon: isVisible ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
                hintText: "password",
                icon: Icons.lock,
                voidCallback: () {
                  isVisible = !isVisible;
                  setState(() {});
                },
              ),
              SizedBox(
                height: 10,
              ),
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthUserLoginState) {
                    snackbarMessenger(context, "Login success");
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ));
                  } else if (state is AuthErrorState) {
                    snackbarMessenger(context, state.errorMsg);
                  }
                },
                child: ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<AuthCubit>(context).logIn(
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  child: Text("Login"),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text("Don't have an account ?"),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ));
                      },
                      child: Text(
                        "create account",
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
