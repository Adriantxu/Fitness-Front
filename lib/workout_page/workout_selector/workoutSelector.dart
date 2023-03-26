import 'package:flutter/material.dart';
import '../workoutInfo.dart';

class WorkoutSelector extends StatefulWidget {
  final Workout workout;

  const WorkoutSelector({Key? key, required this.workout}) : super(key: key);

  @override
  _WorkoutSelectorState createState() => _WorkoutSelectorState(workout);
}

class _WorkoutSelectorState extends State<WorkoutSelector> {
  final Workout workout;
  _WorkoutSelectorState(this.workout);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workout.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Date: ${workout.date}',
              style: TextStyle(fontSize: 18.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Sets:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: workout.sets.length,
              itemBuilder: (context, index) {
                final set = workout.sets[index];
                return ListTile(
                  title: Text(
                      'Set ${index + 1}: ${set.reps} reps, ${set.weight} lbs'),
                  subtitle: Text('Exercise ID: ${set.exerciseId}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
