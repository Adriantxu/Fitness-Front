import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  Widget setTextField(bool obscureText, String labelText, String hintText)
  {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: hintText,
        labelText: labelText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        labelStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  ClipRRect setRoundRectangle(String text, Function f)
  {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 40,
        width: 125,
        color: Colors.blueAccent[400],
        child: TextButton(
          onPressed: () {
            f();
          },
          child: Text(
              text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[600],
        body: SafeArea(
          minimum: const EdgeInsets.fromLTRB(20, 5, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.grey[600],
                  child: Center(
                    child: Image.asset('assets/logo_gym1.png'),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Expanded(
                      child: setTextField(false, 'email', 'something@example.com'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Expanded(
                      child: setTextField(true, 'password', ''),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Expanded(
                      child: setTextField(true, 'confirm password', ''),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Expanded(
                      child: setRoundRectangle('Register', () {}),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
                    child: Expanded(
                      child: setRoundRectangle('Already a user', () {}),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
