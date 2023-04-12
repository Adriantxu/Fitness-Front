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

Future<dynamic> getWorkout() async {
  print(token);
  try {
    final response = await dio.get(
      '$apiUrl/workouts',
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

// Future<dynamic> postWorkout() async {
//   print(token);
//   try {
//     final response = await dio.get(
//       '$apiUrl/workouts',
//       options: Options(
//         headers: {
//           'Authorization': 'Bearer $token',
//         },
//       ),
//     );
//     print(response.data);
//     return response.data;
//   } on DioError catch (e) {
//     print(e.response!.data);
//     return e.response!.data;
//   }
// }
