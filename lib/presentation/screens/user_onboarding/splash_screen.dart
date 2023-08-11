import 'dart:async';

import 'package:flutter/material.dart';
import 'package:note_app/presentation/screens/user_onboarding/sign_up_page.dart';
import 'package:note_app/utils/const.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 300), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: blackColor.withOpacity(0.8),
              backgroundImage: AssetImage("assets/images/app_logo.png"),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Note App")
          ],
        ),
      ),
    );
  }
}
