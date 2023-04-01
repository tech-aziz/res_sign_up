// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromMap(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toMap());

class SignUpModel {
    SignUpModel({
        required this.id,
        required this.restaurantName,
        required this.restaurantAddress,
        required this.restaurantMobileNumber,
        required this.restaurantEmail,
        required this.restaurantPassword,
    });

    int? id;
    String? restaurantName;
    String? restaurantAddress;
    String? restaurantMobileNumber;
    String? restaurantEmail;
    String? restaurantPassword;

//database amader ekta map diye dey ba object dey, database theke data anar jonno fromjson / fromMap method use hoy 
    factory SignUpModel.fromMap(Map<String, dynamic> map) => SignUpModel(
        id: map["id"],
        restaurantName: map["restaurant_name"],
        restaurantAddress: map["restaurant_address"],
        restaurantMobileNumber: map["restaurant_mobile_number"],
        restaurantEmail: map["restaurant_email"],
        restaurantPassword: map["restaurant_password"],
    );
//databae map ney, model ney nah, toJson hocce database e data pathanor jonno
    Map<String, dynamic> toMap() => {
        "id": id,
        "restaurant_name": restaurantName,
        "restaurant_address": restaurantAddress,
        "restaurant_mobile_number": restaurantMobileNumber,
        "restaurant_email": restaurantEmail,
        "restaurant_password": restaurantPassword,
    };
}