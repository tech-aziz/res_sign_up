import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'screens/login.dart';
import 'screens/sign_up.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.orange));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
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

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final userData = GetStorage();
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     userData.writeIfNull('isLogged', false);

//     Future.delayed(Duration.zero, () {
//       checkiflogged();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: SafeArea(
//           child: Center(
//         child: CircularProgressIndicator(),
//       )),
//     );
//   }

//   void checkiflogged() {
//     userData.read('isLogged')
//         ? Get.offAll(const HomePage())
//         : Get.offAll(const LoginScreen());
//   }
// }
