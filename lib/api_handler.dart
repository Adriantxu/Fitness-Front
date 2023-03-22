import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiUrl = 'http://localhost:3030'; 

Future<String> postSignUp() async
{
  final response = await http.post(Uri.parse('$apiUrl/auth/signup'));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    throw Exception('Failed to post that');
  }
}
