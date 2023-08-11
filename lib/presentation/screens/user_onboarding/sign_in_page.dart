import 'package:flutter/material.dart';
import 'package:note_app/presentation/screens/user_onboarding/sign_up_page.dart';

import '../../widgets/input_field.dart';

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
              Text(
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
              ElevatedButton(
                onPressed: () {},
                child: Text("Sign-Up"),
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
