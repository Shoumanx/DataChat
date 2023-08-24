import 'package:flutter/material.dart';
import '../Theme/Color.dart';
import '../Theme/Txt.dart';


Widget infoCards(IconData icn,String title,String des){
  return Container(
    height: 80,margin: EdgeInsets.symmetric(vertical: 10),
    decoration: BoxDecoration(
      color: White,boxShadow: [BoxShadow(color: Shadow,blurRadius: 5,)],borderRadius: BorderRadius.circular(10),
    ),
    child: Row(mainAxisAlignment: MainAxisAlignment.start,children: [
      Container(margin: EdgeInsets.only(left: 10),width:50,height: 50,decoration: BoxDecoration(color: Primary,borderRadius: BorderRadius.circular(5)),child: Icon(icn,color: White,size: 30,),),
      SizedBox(width: 15,),
      Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,children: [
          Row(children: [
            infoName('$title',Primary)
          ],),
          Row(children: [
            infoMsg('$des')
          ],)
        ],),
      )
    ],),
  );
}