import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_services.dart';
import '../widgets/custom_container.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // height: 300,
              height: ScreenUtil().orientation == Orientation.landscape
                  ? AppServices.getDeviceType() == DeviceType.phone
                      ? 300.h
                      : 500.h
                  : 225.h,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(25),
                    bottomLeft: Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 7,
                    spreadRadius: 5,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            Positioned(
              child: SafeArea(
                child: Container(
                  child: customContainer(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
