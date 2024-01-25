import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:veripark_flutter_study_case/models/participant.dart';
import 'package:veripark_flutter_study_case/models/user.dart';

class ApiSevices {
  static const String url = 'https://reqres.in/api';

  Future<User> login(String email, String password) async {
    final response = await http.post(Uri.parse('$url/login'), body: {
      'email': email,
      'password': password,
    });

    if (response.statusCode == 200) {
      print('başarılı');
      final token = json.decode(response.body)['token'];
      print(token);
      return User(email: email, token: token);
    } else {
      print('başarısız');
      throw Exception('Giriş başarısız ${response.statusCode}');
    }
  }

  Future<List<Participant>> getParticipants() async {
    final response = await http.get(Uri.parse('$url/users'));

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body)['data'];
      return responseData.map((e) => Participant.fromJson(e)).toList();
    } else {
      throw Exception(
          'Kullanıcıları getirme başarısız: ${response.statusCode}');
    }
  }
}
