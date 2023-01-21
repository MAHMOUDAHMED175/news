import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{

  static Dio dio;
  // http://api.alquran.cloud/v1/quran/ar.alafasy

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'http://api.alquran.cloud/',
        receiveDataWhenStatusError: true,
      )
    );
  }

  static Future<Response> getData({
    @required String url,
    @required Map<String ,dynamic> query,
  })async{
    return await dio.get(
      url,
      queryParameters: query,
    );
  }

}