import 'package:flutter/material.dart';
import 'package:veripark_flutter_study_case/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veripark_flutter_study_case/services/local_storage_service.dart';
import 'package:veripark_flutter_study_case/views/home_page.dart';

final loginControllerProvider = Provider<LoginController>((ref) {
  return LoginController(ref);
});

class LoginController {
  final Ref ref;
  late final ApiSevices _apiService;
  late final LocalStorageService _localStorageService;

  LoginController(this.ref) {
    _localStorageService = LocalStorageService();
    _apiService = ApiSevices();
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    try {
      final response = await _apiService.login(email, password);
      if (response.token != null) {
        await _localStorageService.saveToken(response.token!);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
    } catch (e) {
      print(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
