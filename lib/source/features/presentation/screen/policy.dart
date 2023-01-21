import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {},
      builder: (context,state){
        var  list=NewsCubit.get(context).policy;
        return articleConditionBuilder(list,context);



      },
    );
  }
}
