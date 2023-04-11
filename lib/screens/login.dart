import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import '../widgets/login_custom_container.dart';
import '../widgets/signup_custom_container.dart';
import '../widgets/custom_size.dart';
import 'package:get_storage/get_storage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _companyEmailTextController = TextEditingController();
  final TextEditingController _companyPasswordTextController = TextEditingController();
  static final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    _companyEmailTextController.dispose();
    _companyPasswordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              // height: 300,
              // height: ScreenUtil().orientation == Orientation.landscape
              //     ? AppServices.getDeviceType() == DeviceType.phone
              //         ? 300.h
              //         : 500.h
              //     : 225.h,

              height: CustomSize.customSize(
                  portPhone: 350.h,
                  portTablet: 320.h,
                  portDesktop: 10.h,
                  landPhone: 560.h,
                  landTablet: 400.h,
                  landDestop: 160.h),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(25.r),
                    bottomLeft: Radius.circular(25.r)),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 7.r,
                    spreadRadius: 5.r,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                ],
              ),
            ),
            Positioned(
              child: SafeArea(
                child: SizedBox(
                    height: CustomSize.customSize(
                        portPhone: 1450.h,
                        portTablet: 1100.h,
                        portDesktop: 0.h,
                        landPhone: 1150.h,
                        landTablet: 1150.h,
                        landDestop: 0.h),
                    child: signInCustomContainer(
                        companyEmailTextController: _companyEmailTextController,
                        companyPasswordTextController: _companyPasswordTextController,

                        formKey: _formKey
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
