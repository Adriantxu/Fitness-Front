import 'package:dio/dio.dart';
import 'auth.dart';

Future<dynamic> postSignUp(String name, String email, String password) async
{
  Object data = {'name': name, 'email': email, 'password': password};

  try {
    final response = await dio.post('$apiUrl/auth/signup', data: data);
    return response;
  } on DioError catch (e) {
    print(e.response!.data);
    return e.response;
  }
}

Future<dynamic> postLogIn(String email, String password) async
{
  Object data  = {'email': email, 'password': password};

  try {
    final response = await dio.post('$apiUrl/auth/login', data: data);
    return response;
  } on DioError catch (e) {
    print(e.response!.data);
    return e.response;
  }
}
