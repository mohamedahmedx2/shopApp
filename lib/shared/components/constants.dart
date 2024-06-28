
import 'package:flutter/material.dart';

import '../../modules/shop_app/shop_login/shop_login_screen.dart';
import '../network/local/cache_helper.dart';

void signOut (context)
{
  CacheHelper.removeData(key: 'token').then((value)
  {
    if(value!)
    {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => ShopLoginScreen()),
            (route) {
          return false;
        },
      );
    }
  });
}


void printFullText(String? text)
{
  final pattren = RegExp('.{1,800}');
  pattren.allMatches(text!).forEach((match) => print(match.group(0),),);
}

String token = '';