import 'package:flutter/material.dart';
import 'package:datachat/Theme/Color.dart';

Widget AdminTitle(String x){
  return Text(x,style: TextStyle(color: Primary,fontSize: 20,fontWeight: FontWeight.bold),);
}


Widget AdminSub(String x){
  return Text(x,style: TextStyle(color: White,fontSize: 17,fontWeight: FontWeight.w300),);
}
