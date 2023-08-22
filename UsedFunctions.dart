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

