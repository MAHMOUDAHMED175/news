import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/source/features/presentation/cubit/states.dart';

import '../../confg/route/route.dart';
import '../../features/presentation/screen/web_view/web_view_screen.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required TextInputType o,
  //52jh
  Function(String) validate,
  Function(String) onSubmit,
  Function(String) onChange,
  @required String label,
  Function() suffixIconn,
  Function() suffixPressed,
  Function() onTap,
  @required IconData prefix,
  IconData suffix,

  bool isPassword=false,
})=>TextFormField(
  controller:controller,
  keyboardType:type,
  onTap:(){
    onTap();
  },

  onChanged: onChange,
  onFieldSubmitted: onSubmit,
  validator: (s){
    validate(s);
  },
  obscureText:isPassword ,
  decoration: InputDecoration(
    labelText:label,
    prefixIcon: Icon(
      prefix,
    ),
    suffixIcon:suffix !=null ? IconButton(
      onPressed:suffixPressed,
      icon: Icon(
        suffix,
      ),
    ):null,
    border: const OutlineInputBorder(),
  ),
);







 void  showDialoge({
  @required String msg,
  @required BuildContext context,
})=>showDialog(
  context: context,
  builder: (context)=>CupertinoAlertDialog(

      title: Text(

  msg,

  style:const TextStyle(

  fontWeight: FontWeight.w300,

  color: Colors.black,

  fontSize: 18.0,

  ),

  ),

    actions: [

      TextButton(

        onPressed: ()=>Navigator.pop(context),

        style: TextButton.styleFrom(

          foregroundColor: Colors.white,

          textStyle: const TextStyle(

            fontWeight: FontWeight.bold,

            color: Colors.black,

            fontSize: 20.0,

          ),

        ),

        child: const Text(

          'OK',

        ),

      ),

    ],

      ),
);




 void  toast({
  @required String msg,
  ToastGravity gravity,
  @required ToastColors state,
})=>Fluttertoast.showToast(
    msg: msg,
  toastLength:Toast.LENGTH_SHORT,
  gravity:gravity??ToastGravity.BOTTOM,
  backgroundColor: toastColors(state),

);

enum ToastColors{SUCCESS,ERROR,WARNING}
Color toastColors(ToastColors state){
Color color;
switch(state){
  case ToastColors.SUCCESS:
    return color=Colors.green;
  case ToastColors.ERROR:
    return color=Colors.red;
  case ToastColors.WARNING:
    return color=Colors.yellow;

}

}




Widget MyDivider()=>Padding(
  padding:  EdgeInsetsDirectional.only(
    start:21.3,
  ),
  child: Container(
    color: Colors.grey,
    height:1.0,
  ),
);


Widget buildArticleItem(article,context,)=>Container(
  child:   InkWell//?????????? ???????? ???????????? ?????????? ???? ?????? ?????????? ?????????? ?????????? ???????? ????????
    (

    onTap: (){
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => WebViewScreen(article["url"]),
          )
      );
    },

    child:   Padding(



      padding: const EdgeInsets.all(8.0),



      child: Row(



        children: [



          Container(



            width:120.0,



            height:120.0,



            decoration: BoxDecoration(



                borderRadius: BorderRadius.circular(28.0,),



                image: DecorationImage(



                    image: NetworkImage(
                      '${article['urlToImage']}',

                    ),



                    fit: BoxFit.cover



                )



            ),



          ),



          SizedBox(



            width:20.0 ,

//kkkkk

          ),
//mnb
        //ll


//5555


          //hello
          Expanded(
//52525
//252

            child: Container(



              height:120.0,



              child: Column(



                mainAxisAlignment: MainAxisAlignment.start,



                crossAxisAlignment: CrossAxisAlignment.start,



                children: [



                  Expanded(



                    child: Text(
                      '${article['title']}',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                     style:Theme.of(context).textTheme.bodyText2,



                    ),



                  ),



                  Text(
                    '${article['publishedAt']}',



                    style:TextStyle(



                      color: Colors.grey,







                    ),



                  ),



                ],



              ),



            ),



          )



        ],



      ),



    ),

  ),
);


Widget articleConditionBuilder(list,context,{isSearch=false})=>ConditionalBuilder(
  condition: list.length>0,
  //kjhg
  //sdcsdcsdc
  builder: (context)=>ListView.separated(
    physics:BouncingScrollPhysics(),//?????????? ???????? ?????????? ???????????? ?????????? ???????????? ?????? ?????????? ???????? ?????????? ???????????? ??????????  ???????? ?????? ???????????? ?????? ????????
    itemBuilder: (context ,index)=>buildArticleItem(list[index],context),
    separatorBuilder: (context , index)=>MyDivider(),
    itemCount:list.length,
  ),
  fallback: (context)=>isSearch?Container():Center(
      child: CupertinoActivityIndicator(radius: 50,)

  ),
);