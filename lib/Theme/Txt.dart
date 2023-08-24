import 'package:flutter/material.dart';
import 'package:datachat/Theme/Color.dart';
import 'package:google_fonts/google_fonts.dart';

Widget AdminTitle(String x){
  return Text(x,style: TextStyle(color: Primary,fontSize: 20,fontWeight: FontWeight.bold),);
}

Widget AdminTitleW(String x){
  return Text(x,style: TextStyle(color: White,fontSize: 20,fontWeight: FontWeight.bold),);
}

Widget SwitchT(String x){
  return Text(x,style: TextStyle(color: White,fontSize: 20,fontWeight: FontWeight.w500),);
}


Widget AdminSub(String x){
  return Text(x,style: TextStyle(color: White,fontSize: 17,fontWeight: FontWeight.w300),);
}

Widget infoName(String txt,Color x){
  return Container(
    child: Text(txt,style: TextStyle(color: x,
      fontSize: 17,
      fontWeight: FontWeight.w600,
    ),overflow: TextOverflow.clip,maxLines: 1)
  );
}

Widget infoMsg(String txt){
  return Container(
    child: Text(txt,style: TextStyle(color: Colors.grey,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),overflow: TextOverflow.clip,maxLines: 1)
  );
}


