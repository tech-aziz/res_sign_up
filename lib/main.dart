import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/sign_up.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
   const SystemUiOverlayStyle(
      statusBarColor: Colors.orange ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sign Up',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: const SignUp(),
        );
      },
      designSize: const Size(800, 1280),
    );
  }
}
