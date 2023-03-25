import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../register/register.dart';
import '../auth.service.dart';

class Login extends StatelessWidget {
  Login({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Widget setTextRedirection(String text, Function func) {
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

  Widget setTextField(bool obscureText, String labelText, String hintText,
      TextEditingController getInfo) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: getInfo,
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

  Future<void> loginUser() async {
    try {
      var response = await postLogIn(
          emailController.toString(), passwordController.toString());
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Widget setRoundRectangle(String text, Function f1) {
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
          loginUser();
          f1();
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
          backgroundColor: Colors.grey[900],
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
                        setTextField(false, 'Email', 'something@example.com',
                            emailController),
                        setTextField(true, 'Password', '', passwordController),
                        setRoundRectangle('Login', () {}),
                        setTextRedirection(
                          "Not a user? Sign up now",
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Register(),
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
