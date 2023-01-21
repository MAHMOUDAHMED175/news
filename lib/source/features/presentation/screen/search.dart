

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController= TextEditingController();

  SearchScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var list=NewsCubit.get(context).search;
        return  Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                  controller: searchController,
                  type:TextInputType.text,
                  onChange:(value){


                    NewsCubit.get(context).getSearch(value);



                  },
                  // validate: (String value){
                  // 	if(value.isEmpty){
                  // 		return 'search is Empty';
                  // 	}
                  // 	return null;
                  // },
                  label: 'Search   ',
                  prefix:Icons.search,
                ),
              ),

              Expanded(
                child: articleConditionBuilder(
                  list,
                  context,
                  isSearch: true,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
