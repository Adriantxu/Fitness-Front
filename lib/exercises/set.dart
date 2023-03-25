import 'dart:io';
import 'package:dio/dio.dart';

final dio = Dio();
final String apiUrl = Platform.isAndroid ? 'http://10.104.66.234:3030' : 'http://localhost:3030';

Future<dynamic> postSet(String exerciseId, String weight, String reps) async
{
  Map<String, String> data = {'exerciseId': exerciseId, 'weight': weight, 'reps': reps};
   try {
    final response = await dio.post('$apiUrl', data: data);
    return response.data;
   } on DioError catch (e) {
    print(e.response!.data);
    return (e.response!.data);
   }
}