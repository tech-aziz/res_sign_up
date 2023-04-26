import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:res_sign_up/screens/home_page.dart';
import 'package:sqflite/sqflite.dart';
import '../database/database_info.dart';
import '../database/init_database.dart';
import '../model/base_response.dart';
import '../utils/snack_messages.dart';

class LoginRepository {
  Database? _database;
  String companyEmailTextController;
  String companyPasswordTextController;
  final userData = GetStorage();

  LoginRepository({
    initDatabase,
    required this.companyEmailTextController,
    required this.companyPasswordTextController,
  });

  void initDatabase() async {
    _database = await InitDatabase().open();
  }

  //Create login
  createLogin(
    String email,
    String password,
  ) async {
    if (_database == null || !_database!.isOpen) {
      _database = await InitDatabase().open();
    }

    try {
      // var query = 'SELECT * FROM ${DatabaseInfo.tableRestaurantInfo}'
      //     ' WHERE ${DatabaseInfo.columnRestaurantEmail}=? AND ${DatabaseInfo.columnRestaurantPassword}=?';
      // var data = await _database!.rawQuery(query);

      List<Map> result = await _database!.rawQuery(
          'SELECT * FROM ${DatabaseInfo.tableRestaurantInfo} WHERE ${DatabaseInfo.columnRestaurantEmail}=? and ${DatabaseInfo.columnRestaurantPassword}=?',
          [email, password]);

      if (result.isNotEmpty & email.isNotEmpty & password.isNotEmpty) {
        print('Sign in successfully done');
        SnackMessage.showSuccess('Sign in successfully done');

        userData.write('isLogged', true);
        userData.write('email', email);
        userData.write('password', password);
        Get.off(() => homePage());
      } else {
        print('Log in failed');
        SnackMessage.showWarning(' Email & Password not correct');
      }

      // print(result);
    } catch (exception) {
      debugPrint(exception.toString());
      return BaseResponse(false, 'Database Exception', null);
    }
  }

  Widget homePage() {
    return HomePages(
      email: companyEmailTextController.toString(),
      password: companyPasswordTextController.toString(),
    );
  }
}
