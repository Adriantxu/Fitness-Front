import 'package:flutter/material.dart';

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

  Widget centerImageAsset(String image)
  {
    return Center(child: Image.asset(image));
  }

  Widget containerImageCenter(String image, Color color, double height, double radius)
  {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        ),
      child: centerImageAsset(image),
    );
  }

  Widget textBox(double height, double width, bool hidden, String label, String hint)
  {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        obscureText: hidden,
        style: const TextStyle(fontSize: 15, color: Colors.white),
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          labelText: label,
          hintText: hint,
          labelStyle: const TextStyle(color: Colors.white),
          hintStyle: const TextStyle(color: Colors.grey),
        ),
      ), 
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // set it to false
      backgroundColor: const Color.fromARGB(255, 47, 46, 46),
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
                  containerImageCenter('assets/gym_photo_1.jpeg', Colors.red, 100, 20),
                  containerImageCenter('assets/gym_photo_2.jpg', Colors.blue, 100, 20),
                  containerImageCenter('assets/gym_photo_3.png', Colors.orange, 100, 20),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 40, 15, 10),
            child: textBox(40, 340, false, 'Email', 'something@gmail.com'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: textBox(40, 340, true, 'Password', 'enter a secure password'),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
          //     child: TextButton(
          //       onPressed: () {
          //         print(emailController.text);
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (_) => HomePage()),
          //         );
          //       },
          //       child: const Text(
          //         'Login',
          //         style: TextStyle(color: Colors.white, fontSize: 17),
          //       ),
          //     ),
          //   ),
          // ),
          // TextButton(
          //   onPressed: () {
          //     // TODO: button press logic
          //   },
          //   style: TextButton.styleFrom(
          //     fixedSize: const Size(200, 70),
          //   ),
          //   child: const Text(
          //     'Forgot Password',
          //     style: TextStyle(color: Colors.blue),
          //   ),
          // ),
          // const SizedBox(height: 20),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (_) => const LoginPage()),
          //     );
          //   },
          //   child: const Text('New User? Create Account',
          //       style: TextStyle(color: Colors.white)),
          // ),
        ],
      ),
    );
  }
}
