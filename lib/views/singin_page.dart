import 'package:flutter/material.dart';
import 'package:veripark_flutter_study_case/views/home_page.dart';
import 'package:veripark_flutter_study_case/widgets/custom_textfiels.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _email = '';
    String _password = '';
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:
                        AssetImage('assets/images/login_page_background.png'))),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      CustomTextField(
                          onSaved: _email,
                          hintText: "",
                          prefixIcon: Icons.person_2_rounded),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        onSaved: _password,
                        hintText: "",
                        prefixIcon: Icons.lock,
                        obscureText: true,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: TextButton(
                              onPressed: () {},
                              child: const Text(""),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        },
                        child: const Text("Giriş Yap"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
