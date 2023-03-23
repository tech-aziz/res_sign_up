import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_info.dart';
import '../database/init_database.dart';
import '../model/base_response.dart';
import '../model/sign_up_model.dart';

class SignUpRepository {
  Database? _database;

  // ignore: non_constant_identifier_names
  SignUpRepository() {
    _initDatabase();
  }

  void _initDatabase() async {
    _database = await InitDatabase().open();
  }

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
      var query = 'INSERT INTO ${DatabaseInfo.tableRestaurantInfo} '
          '(${DatabaseInfo.columnRestaurantName}, ${DatabaseInfo.columnRestaurantMobileNumber}, '
          '${DatabaseInfo.columnRestaurantAddress}, ${DatabaseInfo.columnRestaurantEmail}, '
          '${DatabaseInfo.columnRestaurantPassword},  '
          'VALUES (?, ?, ?, ?, ?);';
      var values = [name, mobile, address, email, password];

      int id = await _database!.rawInsert(query, values);

      if (id > 0) {
        return BaseResponse(true, 'Restaurant Account Created', null);
      } else {
        return BaseResponse(false, 'Could Not Create Restaurant Account', null);
      }
    } catch (exception) {
      debugPrint(exception.toString());
      BaseResponse(false, 'Database Exception', null);
    }
  }
}
