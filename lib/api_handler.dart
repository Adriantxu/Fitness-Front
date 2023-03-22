import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

final dio = Dio();
String apiUrl =
    Platform.isAndroid ? 'http://10.104.66.234:3030' : 'http://localhost:3030';

Future<String> postSignUp() async {
  final response = await http.post(Uri.parse('${apiUrl}/auth/signup'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to post that');
  }
}

Future<String> postLogIn(String email, String password) async {
  // var toSend = json.encode({'email': email, 'password': password});
  var toSend = {'email': email, 'password': password};
  final response = await dio.post('${apiUrl}/auth/login', data: toSend);

  print('Response status code: ${response.statusCode}');
  print('Response body: ${response.data}');

  if (response.statusCode == 201) {
    return response.data;
  } else {
    throw Exception('Failed to post that');
  }
}
