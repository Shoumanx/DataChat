import 'package:datachat/Pages/Login.dart';
import 'package:datachat/Theme/Color.dart';
import 'package:datachat/Widget/UserCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Update extends StatefulWidget {
  @override
  _UpdateState createState() => _UpdateState();
}
class _UpdateState extends State<Update> {

  List<FocusNode> username=[];
  List<FocusNode> password=[];
  List<FocusNode> name=[];
  void initState() {
    super.initState();
    for (int i = 0; i < data.length; i++) {
      username.add(FocusNode());
      password.add(FocusNode());
      name.add(FocusNode());
    }
  }

////////////////////////////////////////////////////////////////////////////////

List data=userTable.showData(userTable.db);




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
                    userCard(data,updateData,username,password,name)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

void updateData(int index, String newValue) {
  setState(() {
    data[index][3] = newValue;
  });
}

}





