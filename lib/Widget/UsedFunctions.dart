import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//  -------> Arrow Function
Widget txt({required String x, clr = Colors.black, double sz = 15, TextAlign ta = TextAlign.start})
=> Text(
  x,
  style: TextStyle(
      color: clr,
      fontSize: sz
  ),
  textAlign: ta,
);

Widget circle({required String x, clr = Colors.red})
=> CircleAvatar(
    radius: 40,
    backgroundColor: clr,
    child: txt(x: x, sz: 30)
);

IconChecker(String str){

  if(str=='admin'){
    return Icons.admin_panel_settings;
  }else{
    return Icons.supervised_user_circle;
  }
}

SwitchChecker(String str){

  if(str=='admin'){
    return true;
  }else{
    return false;
  }
}

