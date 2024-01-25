import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:veripark_flutter_study_case/controllers/login_controller.dart';
import 'package:veripark_flutter_study_case/views/home_page.dart';
import 'package:veripark_flutter_study_case/widgets/custom_textfiels.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      CustomTextField(
                          controller: emailController,
                          hintText: "",
                          prefixIcon: Icons.person_2_rounded),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextField(
                        controller: passwordController,
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
                        onPressed: () async {
                          await loginController.login(emailController.text,
                              passwordController.text, context);
                          print('buttona tıklandı');
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
