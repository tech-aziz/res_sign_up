// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
    SignUpModel({
        this.id,
        this.restaurantName,
        this.restaurantAddress,
        this.restaurantMobileNumber,
        this.restaurantEmail,
        this.restaurantPassword,
    });

    int? id;
    String? restaurantName;
    String? restaurantAddress;
    String? restaurantMobileNumber;
    String? restaurantEmail;
    String? restaurantPassword;

    factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        restaurantAddress: json["restaurant_address"],
        restaurantMobileNumber: json["restaurant_mobile_number"],
        restaurantEmail: json["restaurant_email"],
        restaurantPassword: json["restaurant_password"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_name": restaurantName,
        "restaurant_address": restaurantAddress,
        "restaurant_mobile_number": restaurantMobileNumber,
        "restaurant_email": restaurantEmail,
        "restaurant_password": restaurantPassword,
    };
}
