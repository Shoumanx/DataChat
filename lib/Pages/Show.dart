import 'package:flutter/material.dart';
import '../Theme/Color.dart';
import '../Widget/ShowCard.dart';
import '../Widget/UserCard.dart';
import 'Admin.dart';
import 'Login.dart';
import 'Update.dart';


class Show extends StatefulWidget{
  @override
  _Show createState() => _Show();
}
class _Show extends State<Show> {

////////////////////////////////////////////////////////////////////////////////
  void initState() {
    super.initState();
    userTable.createDatebaseAndTable();
  }
////////////////////////////////////////////////////////////////////////////////
  List data = bulidDatax();

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusScope.of(context).unfocus(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: White,
          body: SingleChildScrollView(
            child: Column(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(alignment: Alignment.topCenter,
                  children: [
                    Container(height: 450,alignment: Alignment.center,
                      decoration: BoxDecoration(color: Primary),
                    ),
                    showCard(context, data)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget txt({required String x, clr = Colors.black, double sz = 15, TextAlign ta = TextAlign.start})
=> Text(x, style: TextStyle(color: clr,fontSize: sz), textAlign: ta,);


List bulidDatax(){
  List data = [];
  List Rx = [];
  for(int i = 0; i < userTable.emp.length; i++){
    List Rx = [];
    Rx.add(userTable.emp[i]['username']);
    Rx.add(userTable.emp[i]['password']);
    Rx.add(userTable.emp[i]['fullName']);
    Rx.add(userTable.emp[i]['type']);
    Rx.add(userTable.emp[i]['id']);
    data.add(Rx);
  }
  print(data);
  return data;
}
