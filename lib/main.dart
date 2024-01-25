import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripark_flutter_study_case/services/local_storage_service.dart';
import 'package:veripark_flutter_study_case/views/home_page.dart';
import 'package:veripark_flutter_study_case/views/singin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Study Case',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff1D3043)),
          useMaterial3: true,
        ),
        home: LocalStorageService().getToken() != null &&
                LocalStorageService().getToken() != ''
            ? HomePage()
            : const LoginPage()),
  ));
}
