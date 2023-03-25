import 'package:flutter/material.dart';
import '../login/login.dart';
import '../register/register.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

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
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        minimum: const EdgeInsets.all(25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                margin: EdgeInsets.zero,
                child: Image.asset('assets/logo_gym1.png'),
              ),
            ),
            setRoundRectangle('Login', () {
              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            }),
            setRoundRectangle('Register', () {
              return Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Register()),
              );
            }),
          ],
        ),
      ),
    );
  }
}
