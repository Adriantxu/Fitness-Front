import 'package:flutter/material.dart';
import '../login/login.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  Widget setTextRedirection(String text, Function func, {Key? key}) {
    return Container(
      key: key,
      child: TextButton(
        onPressed: () {
          func();
        },
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget setTextField(bool obscureText, String labelText, String hintText) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
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
      ),
    );
  }

  Widget setRoundRectangle(String text, Function f) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueAccent[400],
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.all(10),
      height: 35,
      width: 200,
      child: TextButton(
        onPressed: () {
          f();
        },
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
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
            minimum: const EdgeInsets.all(25),
            child: LayoutBuilder(
              builder: (context, constraints) => SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.zero,
                          child: Image.asset('assets/logo_gym1.png'),
                        ),
                        setTextField(false, 'Name', 'Diana Delgado'),
                        setTextField(false, 'Email', 'something@example.com'),
                        setTextField(true, 'Password', ''),
                        setTextField(true, 'Confirm password', ''),
                        setRoundRectangle('Register', () {}),
                        setTextRedirection(
                          "Already a user? Sign in now",
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
