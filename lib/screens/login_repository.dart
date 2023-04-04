import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:res_sign_up/screens/home_page.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_info.dart';
import '../database/init_database.dart';
import '../model/base_response.dart';
import '../model/sign_up_model.dart';
import '../utils/snack_messages.dart';

class LoginRepository {
  Database? _database;

  // ignore: non_constant_identifier_names
  LoginRepository() {
    _initDatabase();
  }

  void _initDatabase() async {
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
        Get.to(() => homePage());
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
  //vai validation ta korte hobe ekhon jemon dekhachi ami wait
// mane faka falue o insert hocce eita korte hobe ekhon


  Widget homePage() {
    return const HomePage();
  }

// getRestaurantList() async {
//   if (_database == null || !_database!.isOpen) {
//     _database = await InitDatabase().open();
//   }
//
//   try {
//     var query = 'SELECT * FROM ${DatabaseInfo.tableRestaurantInfo};';
//
//     var data = await _database!.rawQuery(query);
//
//     var restaurantList = List<SignUpModel>.empty(growable: true);
//     if (data.isNotEmpty) {
//       for (int i = 0; i < data.length; i++) {
//         var map = {};
//         data[i].forEach((key, value) => map[key] = value);
//
//         restaurantList.add(SignUpModel(
//             id: map[DatabaseInfo.columnRestaurantId],
//             restaurantName: map[DatabaseInfo.columnRestaurantName],
//             restaurantAddress: map[DatabaseInfo.columnRestaurantAddress],
//             restaurantEmail: map[DatabaseInfo.columnRestaurantEmail],
//             restaurantMobileNumber:
//                 map[DatabaseInfo.columnRestaurantMobileNumber],
//             restaurantPassword: map[DatabaseInfo.columnRestaurantPassword]));
//       }
//     }
//
//     return BaseResponse(true, 'Restaurant List Loaded', restaurantList);
//   } catch (exception) {
//     debugPrint(exception.toString());
//     return BaseResponse(false, 'Database Exception', null);
//   }
// }
}

// var result = await db.rawQuery('SELECT * FROM my_table WHERE email=?', ['email']);
//  ei query dile akta row er data paben. data gula hocche je email disen oi email er user er. er por oi row er email and password app a input dewa email and password er match korben. match hole log in hobe
//  query te je email diben oi email ta hobe app a input dewa email
//  db.rawQuery('SELECT * FROM my_table WHERE email_column_name=?', ['user_email']);
