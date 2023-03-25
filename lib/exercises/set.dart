import 'package:dio/dio.dart';
import '../auth/auth.dart';

Future<dynamic> postSet(String exerciseId, String weight, String reps) async
{
  Object data = {'exerciseId': exerciseId, 'weight': weight, 'reps': reps};

  try {
    final response = await dio.post('$apiUrl', data: data);
    return response.data;
  } on DioError catch (e) {
    print(e.response!.data);
    return (e.response!.data);
  }
}