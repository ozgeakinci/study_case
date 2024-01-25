import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veripark_flutter_study_case/controllers/login_controller.dart';
import 'package:veripark_flutter_study_case/widgets/custom_textfield.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    String emailHintText = 'Email';
    String passwordHintText = 'Şifre';
    String loginText = 'Giriş yap';

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/veripark_logo.png',
                      alignment: Alignment.center,
                      fit: BoxFit.contain,
                      width: 250,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    CustomTextField(
                        controller: emailController,
                        hintText: emailHintText,
                        prefixIcon: Icons.person_2_rounded),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextField(
                      controller: passwordController,
                      hintText: passwordHintText,
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          fixedSize: const Size(340, 56),
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white),
                      onPressed: () async {
                        await loginController.login(emailController.text,
                            passwordController.text, context);
                      },
                      child: Text(loginText),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
