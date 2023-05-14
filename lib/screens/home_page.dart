import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

import '../settings/settings_controller.dart';
import '../utils/constants.dart';
import 'login.dart';

class HomePages extends StatefulWidget {
  String? email;
  String? password;


  HomePages({super.key, this.email, this.password});

  @override
  State<HomePages> createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  final userData = GetStorage();
  final SettingsController _settingsController = Get.put(SettingsController());
  

  @override
  Widget build(BuildContext context) {
    print('Home page is loading');

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

                        leading:  Obx(() => CircleAvatar(
                            backgroundImage: NetworkImage(_settingsController.imageString.toString())),
                        ),
                        title: Text("Email: ${userData.read('email')}",
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          "Password: ${userData.read('password')}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        trailing: InkWell(
                            onTap: () {
                              userData.write('isLogged', false);
                              userData.remove('email');
                              userData.remove('password');
                              Get.offAll(LoginScreen());
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
