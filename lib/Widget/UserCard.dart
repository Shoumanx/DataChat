import 'package:datachat/Theme/Color.dart';
import 'package:datachat/Theme/Txt.dart';
import 'package:flutter/material.dart';




Widget userCard(List data, Function(int, String) updateData,List<FocusNode> user,List<FocusNode> pass,List<FocusNode> name){

  return Container(
      height: 630,margin: const EdgeInsets.fromLTRB(30,150,30,80),
      decoration: BoxDecoration(color: White,boxShadow: [BoxShadow(color: Colors.black.withAlpha(75),blurRadius: 5,)],borderRadius: BorderRadius.circular(30)),
      child: ListView.builder(

        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(10,20,10,20),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          bool isAdmin = data[index][3] == 'admin';
          return Container(
            margin: const EdgeInsets.fromLTRB(20,10,20,10),
            decoration: BoxDecoration(color: White,boxShadow: [BoxShadow(color: Colors.black.withAlpha(75),blurRadius: 5,)],borderRadius: BorderRadius.circular(15)),
            child: ListTile(contentPadding: const EdgeInsets.all(20),
              subtitle: Column(
                children: [
                  SizedBox(
                    width: 200,height: 40,
                    child: TextFormField(focusNode: user[index],
                      decoration: InputDecoration(
                        filled: true,hintText: 'User:\t${data[index][0]}',
                        fillColor: White,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: White.withBlue(255)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Primary),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      cursorColor: Primary,textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      // Add other properties like controller, validator, onChanged, etc. as needed
                    ),
                  ),
                  SizedBox(
                    width: 200,height: 40,
                    child: TextFormField(focusNode: pass[index],
                      decoration: InputDecoration(
                        filled: true,hintText: 'Pass:\t${data[index][2]}',
                        fillColor: White,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: White.withBlue(255)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Primary),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      cursorColor: Primary,textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      // Add other properties like controller, validator, onChanged, etc. as needed
                    ),
                  ),
                  SizedBox(
                    width: 200,height: 40,
                    child: TextFormField(focusNode: name[index],
                      decoration: InputDecoration(
                        filled: true,hintText: 'Name:\t${data[index][1]}',
                        fillColor: White,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: White.withBlue(255)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Primary),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      cursorColor: Primary,textAlignVertical: TextAlignVertical.bottom,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                      // Add other properties like controller, validator, onChanged, etc. as needed
                    ),
                  ),
                  SizedBox(
                    width: 200,height: 40,
                    child: Row(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Switch(value: isAdmin, onChanged: (newValue) {
                          updateData(index, newValue ? 'admin' : 'user');
                        },),
                        infoMsg('Admin'),
                      ],
                    ),
                  )
                ],
              )
            ),
          );
        },
      )
  );
}