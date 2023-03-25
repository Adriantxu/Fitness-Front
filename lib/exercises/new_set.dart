import 'package:flutter/material.dart';
import 'exercise.dart';
import 'set.dart';
import 'package:dio/dio.dart';

class NewSet extends StatefulWidget {
  final String exerciseId;
  final String workoutId;
  const NewSet({super.key, required this.workoutId, required this.exerciseId});

  @override
  // ignore: no_logic_in_create_state
  State<NewSet> createState() => NewSetState(workoutId: workoutId, exerciseId: exerciseId);
}

class NewSetState extends State<NewSet> {
  final String exerciseId;
  final String workoutId;
  NewSetState({required this.workoutId, required this.exerciseId});

  TextEditingController weightController = TextEditingController();
  TextEditingController repsController = TextEditingController();

  dynamic showError(String error, String statusMessage)
  {
    // ignore: use_build_context_synchronously
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(error),
        content: Text(statusMessage),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      )
    );
  }

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

  Future<void> sendSet(Function f) async
  {
    Response<dynamic> response = await postSet(workoutId, exerciseId, weightController.text, repsController.text);
    if (response.statusCode! < 300) {
      f();
    }
    showError('Add set failed', response.data['message']);
    print(response.toString());
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
        onPressed: () async {
          await sendSet(f);
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
                        return Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Exercise(),
                          ),
                        );
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
