

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/source/features/presentation/cubit/cubit.dart';
import 'package:news/source/features/presentation/cubit/states.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../core/utils/components.dart';

class BusinessScreen extends StatelessWidget {

  @override


  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context,state){
        var  list=NewsCubit.get(context).business;
        return articleConditionBuilder(list,context);
      },
    );
  }
}
