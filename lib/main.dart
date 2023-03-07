import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'registerPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

final TextEditingController emailController = TextEditingController();

List<String> countries = ["Brazil", "Nepal", "India", "China", "USA", "Canada"];

class _LoginDemoState extends State<LoginDemo> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      backgroundColor: Color.fromARGB(255, 47, 46, 46),
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              height: 200,
              width: 300,
              child: PageView(
                controller: _pageController,
                physics: const PageScrollPhysics(),
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:
                        Center(child: Image.asset('assets/gym_photo_1.jpeg')),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Image.asset('assets/gym_photo_3.png')),
                  ),
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(child: Image.asset('assets/gym_photo_3.png')),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
            child: SizedBox(
              height: 40,
              width: 340,
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Email',
                  hintText: 'Enter valid email id as abc@gmail.com',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: const TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: SizedBox(
              height: 40,
              width: 340,
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: 'Password',
                  hintText: 'Enter secure password',
                  labelStyle: TextStyle(color: Colors.white),
                  hintStyle: TextStyle(color: Colors.grey),
                ),
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextButton(
                onPressed: () {
                  print(emailController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => HomePage()),
                  );
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              // TODO: button press logic
            },
            child: const Text(
              'Forgot Password',
              style: TextStyle(color: Colors.blue),
            ),
            style: TextButton.styleFrom(
              fixedSize: const Size(200, 70),
            ),
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => LoginPage()),
              );
            },
            child: const Text('New User? Create Account',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
