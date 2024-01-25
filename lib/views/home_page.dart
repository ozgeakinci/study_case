import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:veripark_flutter_study_case/controllers/participant_controller.dart';
import 'package:veripark_flutter_study_case/views/singin_page.dart';

class HomePage extends ConsumerWidget {
  void logout(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participant = ref.watch(participantsControllerProvider);
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xff1D3043),
          foregroundColor: Colors.white,
          title: const Text('Ana Sayfa'),
          actions: [
            IconButton(
                onPressed: () {
                  logout(context);
                },
                icon: const Icon(Icons.logout))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: FutureBuilder(
            future: participant,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Row(children: [
                        Text(
                          snapshot.data![index].firstName,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          snapshot.data![index].lastName,
                        ),
                      ]),
                      subtitle: Text(
                        snapshot.data![index].email,
                      ),
                      leading: Image.network(snapshot.data![index].avatar),
                    );
                  },
                );
              } else if (snapshot.hasError) {
                return const Text('hata snapshot');
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
