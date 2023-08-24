import 'package:datachat/Pages/Navigation/Navigations.dart';
import 'package:datachat/Pages/Users.dart';
import 'package:datachat/Theme/Color.dart';
import 'package:datachat/Theme/Txt.dart';
import 'package:flutter/material.dart';

import '../Pages/Admin.dart';
import '../Pages/Login.dart';


Widget showCard(BuildContext context, List data){
  return Container(
      height: 600,margin: EdgeInsets.fromLTRB(30,150,30,80),
      decoration: BoxDecoration(color: White,boxShadow: [BoxShadow(color: Colors.black.withAlpha(75),blurRadius: 5,)],borderRadius: BorderRadius.circular(30)),
      child: Stack(
        children: [
          ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.fromLTRB(10,20,10,20),
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(20,10,20,10),
                decoration: BoxDecoration(color: White,boxShadow: [BoxShadow(color: Colors.black.withAlpha(75),blurRadius: 5,)],borderRadius: BorderRadius.circular(15)),
                child: ListTile(
                  onTap: (){
                    BoxDecoration(boxShadow: [BoxShadow(color: Colors.red.withAlpha(75),blurRadius: 5,)]);
                    getId = data[index][4];
                    print('\n\n${data[index][4]}\n\n');
                  },
                  title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [infoName(data[index][0],Primary),infoMsg(data[index][3])],),subtitle: infoMsg(data[index][2],),
                  leading: Container(width: 40,height:40,alignment: Alignment.center,decoration: BoxDecoration(color: Primary,borderRadius: BorderRadius.circular(5)),child: Text('${index}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: White),),),
                ),
              );
            },
          ),
          Container(alignment: Alignment.bottomCenter,
            child: MaterialButton(onPressed: () async {
              await userTable.deleteUsername(getId);
              userTable.emp = await userTable.showData(userTable.db);
              navigateToShowx(context);
            },
              color: Primary,
              child: AdminTitleW('Delete'),),
          )
        ],
      )
  );
}

