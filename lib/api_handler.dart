import 'dart:io';
import 'package:dio/dio.dart';

final dio = Dio();
final String apiUrl = Platform.isAndroid ? 'http://10.104.66.234:3030' : 'http://localhost:3030';

Future<dynamic> postSignUp(String name, String email, String passowrd) async
{
  Map<String, String> data = {'name': name, 'email': email, 'password': passowrd};

  try {
    final response = await dio.post('$apiUrl/auth/signup', data: data);
    return response.data;
  } on DioError catch (e) {
    print(e.response!.data);
    return e.response!.data;
  }
}

Future<dynamic> postLogIn(String email, String password) async
{
  Map<String, String> data  = {'email': email, 'password': password};

  try {
    final response = await dio.post('$apiUrl/auth/login', data: data);
    return response.data;
  } on DioError catch (e) {
    print(e.response!.data);
    return e.response!.data;
  }
}
