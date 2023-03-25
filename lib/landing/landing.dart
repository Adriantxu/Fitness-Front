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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Container(
                  margin: EdgeInsets.zero,
                  child: Image.asset('assets/logo_gym1.png'),
                ),
              ),
              const Text(
                'Welcome to Fit Me',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Your favourite gym app!',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              setRoundRectangle('Login', () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              }),
              const SizedBox(height: 10),
              setRoundRectangle('Register', () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Register()),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
