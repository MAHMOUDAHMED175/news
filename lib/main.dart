
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:desktop_window/desktop_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/source/confg/route/route.dart';
import 'package:news/source/confg/theme/theme.dart';
import 'package:news/source/core/network/local/chache_helper.dart';
import 'package:news/source/core/network/remote/dio_helper.dart';
import 'package:news/source/features/presentation/cubit/cubit.dart';
import 'package:news/source/features/presentation/cubit/observer.dart';
import 'package:news/source/features/presentation/cubit/states.dart';
import 'package:news/source/features/presentation/screen/layout/news_layout.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
   DioHelper.init();
  await ChacheHelper.init();
  bool isDark=ChacheHelper.get('isDark');
  runApp(Start(isDark));
  // if(Platform.isWindows) {
  //   await DesktopWindow.setMinWindowSize(
  //     const Size(800.0,500.0),
  //   );
  // }
}
class Start extends StatelessWidget {
  final bool isDark;
  const Start(this.isDark, {Key key}) : super(key: key);

  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) => NewsCubit()..changeMode(
        fromSaved: isDark,
      )..getBusiness()..getEntertainment()..getPolicy()..getScience()..getSports()..getTechnology(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,index){},
        builder:(context,index)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme:light,
          darkTheme: dark,
          themeMode: NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
          //onGenerateRoute: Routes.onGenerate,
          home: NewsLayout(),
        ),
      ),
    );
  }
}
