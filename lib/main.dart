import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripark_flutter_study_case/views/home_page.dart';
import 'package:veripark_flutter_study_case/views/singin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Study Case',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: prefs.getString('token') != null
            ? const HomePage()
            : const LoginPage()),
  ));
}
