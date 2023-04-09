import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../global/styles.dart';
import 'package:get/get.dart';

import 'login.dart';

class HomePages extends StatefulWidget {
  String? email;
  String? password;
  final userData = GetStorage();

  HomePages({super.key, this.email, this.password});

  @override
  State<HomePages> createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {

    print('Home page is loading');
    final userData = GetStorage();
    
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                child: Column(
                  children: [
                    Card(
                      elevation: 12,
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29uYXxlbnwwfHwwfHw%3D&w=1000&q=80',
                          ),
                        ),
                        title: Text("Email: ${userData.read('email')}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "Password: ${userData.read('password')}",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        trailing: InkWell(
                            onTap: () {
                              userData.write('isLogged', false);
                              userData.remove('email');
                              userData.remove('password');
                              Get.offAll(const LoginScreen());
                            },
                            child: const Icon(Icons.logout_rounded)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
