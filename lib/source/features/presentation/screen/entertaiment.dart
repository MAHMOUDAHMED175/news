import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class EntertainmentScreen extends StatelessWidget {
  const EntertainmentScreen({Key key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context,state){
        var  list=NewsCubit.get(context).entertainment;
        return articleConditionBuilder(list,context);


//58252525525252555
      //55
      },
    );
  }
}
