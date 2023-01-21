
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news/source/core/utils/color.dart';
import 'package:news/source/core/utils/fonts.dart';

ThemeData light=ThemeData(
    primaryColor: ColorsNews.primary,
    hintColor: ColorsNews.hint,
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    fontFamily:Fonts.fontFamily,

  textTheme: TextTheme(
    bodyText2: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: Colors.black
    ),
  ),
    appBarTheme:  AppBarTheme(
      titleSpacing: 20.0,
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.blue.withOpacity(0.28),
          statusBarIconBrightness:Brightness.light
      ),
      // centerTitle: true,
       color: ColorsNews.primary,
      elevation: 5,
      titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.bold

      ),

    ),
    // textTheme:  TextTheme(
    //   bodyMedium:  TextStyle(
    //     height: 1.5,
    //     fontSize: 15.0,
    //     color: Colors.white,
    //     fontWeight: FontWeight.bold,
    //   ),
    //
    // ),
  );


ThemeData dark=ThemeData(

scaffoldBackgroundColor: HexColor('375563'),
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0,
    systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.grey.withOpacity(0.28),
        statusBarIconBrightness:Brightness.light
    ),
    backgroundColor:HexColor('375563'),
    elevation:0.0,
    titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold
    ),
    iconTheme:IconThemeData(
      color: Colors.white,
    ) ,
  ),

  textTheme: TextTheme(
    bodyText2: TextStyle(
      fontSize: 18.0,
       fontWeight: FontWeight.w600,
      color: Colors.white
    ),
  ),


);
// ThemeData darkThem=ThemeData(
//   scaffoldBackgroundColor: HexColor('375563'),
//
//   primarySwatch: dafultColor,//علشان يغير لون اللودنج وهيا بتلف لبرتقالى
//   appBarTheme: AppBarTheme(
//     titleSpacing: 20.0,
//     systemOverlayStyle: SystemUiOverlayStyle(
//         statusBarColor: Colors.grey.withOpacity(0.28),
//         statusBarIconBrightness:Brightness.light
//     ),
//     backgroundColor:HexColor('375563'),
//     elevation:0.0,
//     titleTextStyle: TextStyle(
//         color: Colors.white,
//         fontSize: 20.0,
//         fontWeight: FontWeight.bold
//     ),
//     iconTheme:IconThemeData(
//       color: Colors.white,
//     ) ,
//   ),
//   textTheme:TextTheme(
//     bodyText1:TextStyle(
//         fontSize: 15.0,
//         fontWeight: FontWeight.w600,
//         color: Colors.white
//     ),
//   ) ,
//   bottomNavigationBarTheme: BottomNavigationBarThemeData(
//     type: BottomNavigationBarType.fixed,
//     selectedItemColor: dafultColor,
//     unselectedItemColor: Colors.grey,
//     elevation: 3.0,
//     backgroundColor: HexColor('375563'),
//   ),
//   fontFamily: 'Short',
// );
