import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/source/core/network/local/chache_helper.dart';
import 'package:news/source/core/network/remote/dio_helper.dart';
import 'package:news/source/features/presentation/cubit/states.dart';
import 'package:news/source/features/presentation/screen/business.dart';
import 'package:news/source/features/presentation/screen/entertaiment.dart';
import 'package:news/source/features/presentation/screen/policy.dart';
import 'package:news/source/features/presentation/screen/science.dart';
import 'package:news/source/features/presentation/screen/search.dart';
import 'package:news/source/features/presentation/screen/sports.dart';
import 'package:news/source/features/presentation/screen/technology.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit() : super(InitState());

  static NewsCubit get(context)=>BlocProvider.of(context);


  int currentIndex=0;

  List<Widget> screen=[
    BusinessScreen(),
    ScienceScreen(),
    SportsScreen(),
    PolicyScreen(),
    TechnologyScreen(),
    EntertainmentScreen(),
    SearchScreen(),
  ];

  void ChangeIndex(index){
    if(index==0)
      {
        getBusiness();
      }
    currentIndex=index;
    emit(ChangeCurvedNavBarState());

  }


  // http://api.alquran.cloud/v1/quran/ar.alafasy
  List<dynamic> business=[];
  void getBusiness(){
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'business',
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',
        }
    ).then((value) {
      business=value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });

  }
  List<dynamic> sports=[];
  void getSports(){
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'sports',
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',
        }
    ).then((value){
      sports=value.data['articles'];
      print(sports[0]['title']);
      emit((NewsGetSportsSuccessState()));
    }).catchError((error){
      print(error.toString());
      emit((NewsGetSportsErrorState(error.toString())));
    });
  }

  List<dynamic> science=[];
  void getScience(){
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'science',
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',

        }
        //fff

        //468597
    ).then((value){
      science=value.data['articles'];
      print(science[0]['title']);

      emit((NewsGetScienceSuccessState()));
    }).catchError((error){
      print(error.toString());
      emit((NewsGetScienceErrorState(error.toString())));

    });
  }
  //nbnb5555
  //555
  List<dynamic> policy=[];
  void getPolicy(){
    emit(NewsGetPolicyLoadingState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'politics',
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',
        }
    ).then((value){
      policy=value.data['articles'];
      print(policy[0]['title']);
      emit((NewsGetPolicySuccessState()));
    }).catchError((error){
      print(error.toString());
      emit((NewsGetPolicyErrorState(error.toString())));
    });
  }
  List<dynamic> search=[];
  void getSearch(String value){
    emit(NewsGetSearchLoadingState());
    DioHelper.getData(
        url:'v2/everything',
        query:{
          'q':value,
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',
        }
    ).then((value){
      search=value.data['articles'];
      print(search[0]['title']);
      emit((NewsGetSearchSuccessState()));
    }).catchError((error){
      print(error.toString());
      emit((NewsGetSearchErrorState(error.toString())));
    });
  }
  List<dynamic> entertainment=[];
  void getEntertainment(){
    emit(NewsGetEntertainmentLoadingState());

    DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'entertainment',
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',
        }
    ).then((value){
      entertainment=value.data['articles'];
      emit((NewsGetEntertainmentSuccessState()));
    }).catchError((error){
      print(error.toString());
      emit((NewsGetEntertainmentErrorState(error.toString())));
    });
  }
  List<dynamic> technology=[];
  void getTechnology(){
    emit(NewsGetTechnologyLoadingState());
    DioHelper.getData(
        url:'v2/top-headlines',
        query:{
          'country':'eg',
          'category':'technology',
          'apiKey':'7d2f289e8a7742a1951724d05bef8e81',
        }
    ).then((value){
      technology=value.data['articles'];
      emit((NewsGetTechnologySuccessState()));
    }).catchError((error){
      print(error.toString());
      emit((NewsGetTechnologyErrorState(error.toString())));
    });
  }




  bool isDark=false;
  void changeMode({bool fromSaved}){
    if(fromSaved!=null)
      {

        isDark=fromSaved;
        isDark=!isDark;

        emit(ChangeModeState());
      }
    else
      {

        isDark=!isDark;
        ChacheHelper.put('isDark',isDark).then((valye){

          emit(ChangeModeState());

        });
      }

    }














}