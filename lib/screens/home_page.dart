import 'package:flutter/material.dart';

import '../global/styles.dart';

class HomePage extends StatefulWidget {
  String? email;
  String? password;
  HomePage({super.key, required this.email, this.password});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 12,
              child: Column(
                children: [
                  Text(
                    widget.email.toString(),
                    style: Style.largeInputText(),
                  ),
                  Text(
                    widget.password.toString(),
                    style: Style.largeInputText(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
