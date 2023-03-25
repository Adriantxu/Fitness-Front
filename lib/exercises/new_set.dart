import 'package:flutter/material.dart';
import 'exercise.dart';
import 'set.dart';

class NewSet extends StatefulWidget {
  const NewSet({super.key});

  @override
  State<NewSet> createState() => NewSetState();
}

class NewSetState extends State<NewSet> {

  TextEditingController weightController = TextEditingController();
  TextEditingController repsController = TextEditingController();

  Widget setTextField(bool obscureText, String labelText, TextEditingController controller) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
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

  // Future<void> signUpUser() async
  // {
  //   String response;
  //   if (passwordController.text != confirmController.text) {
  //     throw Exception('Passwords are different');
  //   } else {
  //     response = await postSignUp(nameController.text, emailController.text, passwordController.text);
  //     print('[ERROR]: ${response.toString()}');
  //   }
  // }

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
          // post data
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
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Exercise'),
        ),
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
                      setTextField(false, 'Weight', weightController),
                      setTextField(false, 'Reps', repsController),
                      setRoundRectangle('Add', () {
                        // return Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => Exercise(),
                        //   ),
                        // );
                      }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ),
    );
  }
}
