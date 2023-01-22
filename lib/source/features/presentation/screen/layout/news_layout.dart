import 'package:conditional_builder/conditional_builder.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/source/confg/route/route.dart';
import 'package:news/source/core/utils/fonts.dart';
import 'package:news/source/features/presentation/cubit/cubit.dart';
import 'package:news/source/features/presentation/cubit/states.dart';
import 'package:news/source/features/presentation/screen/search.dart';
class NewsLayout extends StatelessWidget {
  const NewsLayout({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(

          appBar: AppBar(
            title: Text(
              Fonts.appName,
            ),
            actions: [
              IconButton(
                icon:Icon(Icons.search),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
                },

              ),
              IconButton(
                icon:Icon(Icons.brightness_4_outlined),
                onPressed: (){
                  NewsCubit.get(context).changeMode();
                },

              ),
            ],
          ),
          bottomNavigationBar: CurvedNavigationBar(
            index: cubit.currentIndex,
            onTap: (index) {
              cubit.ChangeIndex(index);
              // TodoCubit.get(context).ChangeIndex(index);
            },
            color: Colors.black,
            height: 60,
            animationDuration: const Duration(
              milliseconds: 1,
            ),
            buttonBackgroundColor: Colors.grey.withOpacity(0.3),
            animationCurve: Curves.linearToEaseOut,
            backgroundColor: Colors.grey.withOpacity(0.2),
            items: const [
              Icon(Icons.paid_rounded, color: Colors.blue,),
              Icon(Icons.science, color: Colors.blue,),
              Icon(Icons.sports, color: Colors.blue,),
              Icon(Icons.policy, color: Colors.blue,),
              Icon(Icons.biotech_sharp, color: Colors.blue,),
              Icon(Icons.park_rounded, color: Colors.blue,),
            ],
          ),
          body: cubit.screen[cubit.currentIndex],
        );
      },

    );
  }
}
