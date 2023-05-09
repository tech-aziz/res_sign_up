import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/login_custom_container.dart';
import '../widgets/custom_size.dart';

class LoginScreen extends StatefulWidget {


  // XFile ? imageFile;
   LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _companyEmailTextController =
      TextEditingController();
  final TextEditingController _companyPasswordTextController =
      TextEditingController();

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
              height: ScreenUtil().orientation == Orientation.portrait
                  ? 300.w
                  : 150.w, // width is not set yet.
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
                    height: ScreenUtil().orientation == Orientation.portrait
                        ? ScreenUtil().screenHeight
                        : ScreenUtil().screenHeight,
                    child: signInCustomContainer(
                        companyEmailTextController: _companyEmailTextController,
                        companyPasswordTextController:
                            _companyPasswordTextController,

                        formKey: _formKey)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
