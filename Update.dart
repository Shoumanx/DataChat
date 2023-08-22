
import 'package:flutter/material.dart';
import 'Admin.dart';
import 'Login.dart';


class Update extends StatefulWidget{
  @override
  _Update createState() => _Update();
}
class _Update extends State<Update> {
  @override
  void initState() {
    super.initState();
    userTable.createDatebaseAndTable();
  }
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Update'),
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
                    Card(
                      color: Colors.amber,
                      child: ListTile(
                        title: txt(x: 'Name: ${justUser[0]['username']}', clr: Colors.black),
                      ),
                    ),
            Card(
              color: Colors.amber,
              child: ListTile(
                title: txt(x: 'password: ${justUser[0]['password']}', clr: Colors.black),
              ),
            ),Card(
          color: Colors.amber,
          child: ListTile(
            title: txt(x: 'full name: ${justUser[0]['fullName']}', clr: Colors.black),
          ),
        ),Card(
          color: Colors.amber,
          child: ListTile(
            title: txt(x: 'type: ${justUser[0]['type']}', clr: Colors.black),
          ),
        ),
                  Padding(
                    padding: const EdgeInsets.only(top : 15.0),
                    // child: feild(user, 'Mostafa', 'Username', Icon(Icons.account_circle)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 50, right: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          onPressed: () async {
                              userTable.UpdateUsername('Updated', 'Updated', 'Updated', 'Updated', getId);
                              justUser = await userTable.showDataByIdx(userTable.db, getId);
                            setState(() {

                            });
                          },
                          elevation: 15,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              txt(x: 'Update'),
                              Icon(Icons.update),
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



Widget feild(TextEditingController x, String hint, String label, Icon icn) => Padding(
  padding: const EdgeInsets.only(bottom: 15.0, left: 5, right: 5),
  child: TextField(
    controller: x,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        hintText: hint,
        icon: icn,
        labelText: label
    ),
  ),
);


Widget txt({required String x, clr = Colors.black, double sz = 15, TextAlign ta = TextAlign.start})
=> Text(
  x,
  style: TextStyle(
      color: clr,
      fontSize: sz
  ),
  textAlign: ta,
);
