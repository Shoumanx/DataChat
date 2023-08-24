import 'package:flutter/material.dart';
import 'Admin.dart';
import 'Login.dart';


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

  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('List of employees'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Container(
          color: Colors.amberAccent,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
                children: [
                  for(int i = 0; i < userTable.emp.length; i++)
                    Card(
                      color: Colors.pink,
                      shadowColor: Colors.grey,
                      elevation: 5,
                      child: ListTile(
                        onTap: () {
                            getId = userTable.emp[i]['id'];
                        },
                        title: txt(x: userTable.emp[i]['username'], clr: Colors.black),
                        leading: CircleAvatar(
                          radius: 15.0,
                          child: txt(x: userTable.emp[i]['id'].toString()),
                        ),
                        subtitle: txt(x: userTable.emp[i]['fullName'], clr: Colors.amber),
                        trailing: txt(x: userTable.emp[i]['type'], clr: Colors.amber),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                            await userTable.deleteUsername(getId);
                            userTable.emp = await userTable.showData(userTable.db);
                            setState(() {

                            });
                          },
                          elevation: 15,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              txt(x: 'Delete'),
                              Icon(Icons.delete),
                            ],
                          ),
                          color: Colors.amberAccent,
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ),
        ),
      );
}

Widget txt({required String x, clr = Colors.black, double sz = 15, TextAlign ta = TextAlign.start})
=> Text(x, style: TextStyle(color: clr,fontSize: sz), textAlign: ta,);
