import 'package:flutter/material.dart';

import 'home_page.dart';

class ViewNoteScreen extends StatelessWidget {
  const ViewNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_ios_new_sharp)),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    },
                    child: Text(
                      "Save",
                      style: TextStyle(fontSize: 21),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
