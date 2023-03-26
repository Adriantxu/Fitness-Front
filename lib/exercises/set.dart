import 'package:dio/dio.dart';
import '../auth/auth.dart';

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