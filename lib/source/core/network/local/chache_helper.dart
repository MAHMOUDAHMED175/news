

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChacheHelper{
  static SharedPreferences sharedPreferences;
  static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }

  static Future<bool> put(
      String key,
      bool value,
      )async{
    return await sharedPreferences.setBool(key,value);
  }
  static bool get(
      @required String key,
      ){
    return sharedPreferences.getBool(key);
  }


}