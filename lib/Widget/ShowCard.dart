import 'package:datachat/Pages/Users.dart';
import 'package:datachat/Theme/Color.dart';
import 'package:datachat/Theme/Txt.dart';
import 'package:flutter/material.dart';


Widget showCard(List data){
  return Container(
      height: 600,margin: EdgeInsets.fromLTRB(30,150,30,80),
      decoration: BoxDecoration(color: White,boxShadow: [BoxShadow(color: Colors.black.withAlpha(75),blurRadius: 5,)],borderRadius: BorderRadius.circular(30)),
      child: ListView.builder(
        physics: BouncingScrollPhysics(),

        padding: EdgeInsets.fromLTRB(10,20,10,20),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.fromLTRB(20,10,20,10),
            decoration: BoxDecoration(color: White,boxShadow: [BoxShadow(color: Colors.black.withAlpha(75),blurRadius: 5,)],borderRadius: BorderRadius.circular(15)),
            child: ListTile(
              title: infoName(data[0][0],Primary),subtitle: infoMsg(data[0][1]),
              leading: Container(width: 40,height:40,alignment: Alignment.center,decoration: BoxDecoration(color: Primary,borderRadius: BorderRadius.circular(5)),child: Text('${index + 1}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: White),),),
            ),
          );
        },
      )
  );
}