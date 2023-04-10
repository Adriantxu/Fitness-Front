import 'package:dio/dio.dart';
import '../auth/auth.dart';

Future<dynamic> getExerciseName(int id) async {
  print(token);
  try {
    print(id);
    final response = await dio.get(
      '$apiUrl/exercises/name/$id',
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    print(response.data);
    return response.data;
  } on DioError catch (e) {
    print(e.response!.data);
    return e.response!.data;
  }
}

Future<dynamic> postSet(int workoutId, int exerciseId, String weight, String reps) async
{
  Object data = {'workoutId': workoutId, 'exerciseId': exerciseId, 'weight': weight, 'reps': reps};

  try {
    final response = await dio.post('$apiUrl', data: data);
    return response;
  } on DioError catch (e) {
    print(e.response!.data);
    return (e.response);
  }
}