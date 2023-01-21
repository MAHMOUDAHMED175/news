 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/source/features/presentation/screen/business.dart';
import 'package:news/source/features/presentation/screen/entertaiment.dart';
import 'package:news/source/features/presentation/screen/policy.dart';
import 'package:news/source/features/presentation/screen/search.dart';
import 'package:news/source/features/presentation/screen/sports.dart';
import 'package:news/source/features/presentation/screen/technology.dart';
import 'package:news/source/features/presentation/screen/web_view/web_view_screen.dart';

import '../../features/presentation/screen/layout/news_layout.dart';
import '../../features/presentation/screen/science.dart';

class Routes{

  static const String init='/';
  static const String business='/business';
  static const String science='/science';
  static const String sports='/sports';
  static const String policy='/policy';
  static const String technology='/technology';
  static const String entertainment='/entertainment';
  static const String search='/search';

  static Route onGenerate(RouteSettings routeSettings){

    switch(routeSettings.name)
    {
      case init:
        return MaterialPageRoute(builder: (context)=>NewsLayout());
      case business:
        return MaterialPageRoute(builder: (context)=>BusinessScreen());
      case science:
        return MaterialPageRoute(builder: (context)=>ScienceScreen());

      case sports:
        return MaterialPageRoute(builder: (context)=>SportsScreen());
      case policy:
          return MaterialPageRoute(builder: (context)=>PolicyScreen());
      case technology:
        return MaterialPageRoute(builder: (context)=>TechnologyScreen());
      case entertainment:
        return MaterialPageRoute(builder: (context)=>EntertainmentScreen());
      case search:
        return MaterialPageRoute(builder: (context)=>SearchScreen());
    }
    return null;
  }
 }