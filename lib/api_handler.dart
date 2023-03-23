import 'dart:io';
import 'package:dio/dio.dart';

final dio = Dio();
final String apiUrl = Platform.isAndroid ? 'http://10.104.66.234:3030' : 'http://localhost:3030';

Future<String> postLogIn(String email, String password) async {
  var data = {'email': email, 'password': password};
  final response = await dio.post('$apiUrl/auth/login', data: data);

  if (response.statusCode == 201) {
    return response.data;
  } else {
    throw Exception('Failed to post that');
  }
}
