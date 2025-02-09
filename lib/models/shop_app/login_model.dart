import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shop_app/shared/components/components.dart';

class ShopLoginModel {
  late bool status;
  late String message;
  late UserData data;

  ShopLoginModel.fromJson(Map<String , dynamic> json)
  {
     status = json['status'];
     message = json['message'];
     if (json['data'] != null) {
       data = UserData.fromJson(json['data']);
     } else {
       json['data'] =  null;

      showToast(text: message, state: ToastStates.ERROR);

     }


  }
}


class UserData {
  late int id;
  late String name;
  late String email;
  late String phone;
  late String image;
  late int points;
  late int credit;
  late String token;



  // named constructor //

  UserData.fromJson(Map<String , dynamic> json)
  {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    points = json['points'];
    credit = json['credit'];
    token = json['token'];
  }


}