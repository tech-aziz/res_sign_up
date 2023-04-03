import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_info.dart';
import '../database/init_database.dart';
import '../model/base_response.dart';
import '../model/sign_up_model.dart';
import '../utils/snack_messages.dart';

class SignUpRepository {
  Database? _database;

  // ignore: non_constant_identifier_names
  SignUpRepository() {
    _initDatabase();
  }

  void _initDatabase() async {
    _database = await InitDatabase().open();
  }
//sob data age fetch korechen ?humm
  // vai ek kaj ta kemne korte hobe jodi dekhai diten.
  // wait ami akta query dicchi
  // ok vai
  // ami query ta lan a dicchi
  //ok den vai

  getRestaurantList() async {
    if (_database == null || !_database!.isOpen) {
      _database = await InitDatabase().open();
    }

    try {
      var query = 'SELECT * FROM ${DatabaseInfo.tableRestaurantInfo};';

      var data = await _database!.rawQuery(query);

      var restaurantList = List<SignUpModel>.empty(growable: true);
      if (data.isNotEmpty) {
        for (int i = 0; i < data.length; i++) {
          var map = {};
          data[i].forEach((key, value) => map[key] = value);

          restaurantList.add(

              // Employee(
              //   employeeId: map[DatabaseInfo.columnEmployeeId],
              //   name: map[DatabaseInfo.columnEmployeeName],
              //   address: map[DatabaseInfo.columnEmployeeAddress],
              //   email: map[DatabaseInfo.columnEmployeeEmail],
              //   imagePath: map[DatabaseInfo.columnImagePath],
              //   isWaiter:
              //       map[DatabaseInfo.columnEmployeeIsWaiter] == 1 ? true : false,
              //   isActive:
              //       map[DatabaseInfo.columnEmployeeIsActive] == 1 ? true : false,
              //   mobileNumber: map[DatabaseInfo.columnEmployeeMobileNumber],
              //   createdBy: map[DatabaseInfo.columnCreatedBy],
              //   createdTime: map[DatabaseInfo.columnCreatedTime])

              SignUpModel(
                  id: map[DatabaseInfo.columnRestaurantId],
                  restaurantName: map[DatabaseInfo.columnRestaurantName],
                  restaurantAddress: map[DatabaseInfo.columnRestaurantAddress],
                  restaurantEmail: map[DatabaseInfo.columnRestaurantEmail],
                  restaurantMobileNumber:
                      map[DatabaseInfo.columnRestaurantMobileNumber],
                  restaurantPassword:
                      map[DatabaseInfo.columnRestaurantPassword]));
        }
      }

      return BaseResponse(true, 'Restaurant List Loaded', restaurantList);
    } catch (exception) {
      debugPrint(exception.toString());
      return BaseResponse(false, 'Database Exception', null);
    }
  }



  //Create SignUp
createRestaurant(
    String name,
    String mobile,
    String address,
    String email,
    String password,
  ) async {
    if (_database == null || !_database!.isOpen) {
      _database = await InitDatabase().open();
    }

    try {
      var query = 'INSERT INTO ${DatabaseInfo.tableRestaurantInfo}'
          '(${DatabaseInfo.columnRestaurantName}, ${DatabaseInfo.columnRestaurantMobileNumber}, '
          '${DatabaseInfo.columnRestaurantAddress}, ${DatabaseInfo.columnRestaurantEmail}, '
          '${DatabaseInfo.columnRestaurantPassword})'
          'VALUES (?, ?, ?, ?, ?);';
      var values = [name, mobile, address, email, password];

    final int id = await _database!.rawInsert(query, values);

      if (id > 0) {
        print("Restaurant account created $id"); 
        return BaseResponse(true, 'Restaurant Account Created', null);
      
      } else {
        print("Restaurant account not created");
        return BaseResponse(false, 'Could Not Create Restaurant Account', null);
      }
    } catch (exception) {
      debugPrint(exception.toString());
      BaseResponse(false, 'Database Exception', null);
    }
  }
}

// paisen ? hum vai paichi but login er kaj ta korte parchi nah.
// table a search diye check korben je email and password input dicchen oita table ache ki na
// thakle log in hobe na hole no user found...vai eitai korte pari nai onk try korchi basay o
// query kunta disen ?

// var result = await db.rawQuery('SELECT * FROM my_table WHERE email=?', ['email']);
//  ei query dile akta row er data paben. data gula hocche je email disen oi email er user er. er por oi row er email and password app a input dewa email and password er match korben. match hole log in hobe
//  query te je email diben oi email ta hobe app a input dewa email
//  db.rawQuery('SELECT * FROM my_table WHERE email_column_name=?', ['user_email']);