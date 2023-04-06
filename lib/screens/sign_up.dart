import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/app_services.dart';
import '../widgets/signup_custom_container.dart';
import '../widgets/custom_size.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _companyNameTextController =
      TextEditingController();
  final TextEditingController _companyAddressTextController =
      TextEditingController();
  final TextEditingController _companyPhoneTextController =
      TextEditingController();
  final TextEditingController _companyEmailTextController =
      TextEditingController();
  final TextEditingController _companyPasswordTextController =
      TextEditingController();
  final TextEditingController _companyConfirmPasswordTextController =
      TextEditingController();
  static final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _companyNameTextController.dispose();
    _companyAddressTextController.dispose();
    _companyPhoneTextController.dispose();
    _companyEmailTextController.dispose();
    _companyPasswordTextController.dispose();
    _companyConfirmPasswordTextController.dispose();
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
                  child: signUpCustomContainer(
                      companyNameTextController: _companyNameTextController,
                      companyAddressTextController:
                          _companyAddressTextController,
                      companyEmailTextController: _companyEmailTextController,
                      companyPhoneTextController: _companyPhoneTextController,
                      companyPasswordTextController:
                          _companyPasswordTextController,
                      companyConfirmPasswordTextController:
                          _companyConfirmPasswordTextController,
                      formKey: _formKey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
