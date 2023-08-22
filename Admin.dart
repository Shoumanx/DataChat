import 'dart:ui';
import 'package:datachat/Theme/Color.dart';
import 'package:datachat/Theme/Txt.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Admin extends StatefulWidget {
  @override
  _AdminState createState() => _AdminState();
}
class _AdminState extends State<Admin> {

  final FocusNode Update = FocusNode();
  final FocusNode Delete = FocusNode();
  TextEditingController Upd =TextEditingController();
  TextEditingController Del =TextEditingController();


  @override
  void initState() {
    super.initState();
    Update.addListener(() {
      if (!Update.hasFocus) {
        Update.unfocus();
      }
    });
    Delete.addListener(() {
      if (!Delete.hasFocus) {
        // When the field loses focus (e.g., when tapping outside), unfocus it.
        Delete.unfocus();
      }
    });
  }

  @override
  void dispose() {
    Update.dispose();
    Delete.dispose();
    super.dispose();
  }
  //////////////////////////////////////////////////////////////////////////////

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Update.unfocus();Delete.unfocus();},
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: White,
          body: Column(mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Stack(
                children: [
                  Container(height: 650,padding: EdgeInsets.symmetric(vertical: 100),
                    decoration: BoxDecoration(color: Black,borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                    child: ListView(children: [
                      Container(margin: EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(onPressed: (){},color: Colors.transparent,elevation: 0,
                          child: ListTile(leading: Container(height: 60,width: 60,decoration: BoxDecoration(
                            color: White,borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),child: Icon(CupertinoIcons.person_crop_circle_badge_plus,color: Primary,),),
                            title: AdminTitle('Add User'),subtitle: AdminSub('Add user to the database'),),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            trailing: Container(
                              width: 35, // Adjust the width as per your needs
                              child: TextFormField(
                                controller: Upd,
                                focusNode: Update,
                                decoration: InputDecoration(
                                  filled: true,
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
                                cursorColor: Primary,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                // Add other properties like controller, validator, onChanged, etc. as needed
                              ),
                            ),
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: White,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Icon(CupertinoIcons.cloud_upload_fill, color: Primary),
                            ),
                            title: AdminTitle('Update User'),
                            subtitle: AdminSub('Change user data'),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(
                          onPressed: () {},
                          color: Colors.transparent,
                          elevation: 0,
                          child: ListTile(
                            trailing: Container(
                              width: 35, // Adjust the width as per your needs
                              child: TextFormField(
                                controller: Del,
                                focusNode: Delete,
                                decoration: InputDecoration(
                                  filled: true,
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
                                cursorColor: Primary,
                                keyboardType: TextInputType.text,
                                textInputAction: TextInputAction.done,
                                // Add other properties like controller, validator, onChanged, etc. as needed
                              ),
                            ),
                            leading: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: White,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                              child: Icon(CupertinoIcons.person_crop_circle_badge_xmark, color: Primary),
                            ),
                            title: AdminTitle('Delete User'),
                            subtitle: AdminSub('Remove user data'),
                          ),
                        ),
                      ),
                      Container(margin: EdgeInsets.symmetric(vertical: 10),
                        child: MaterialButton(onPressed: (){},color: Colors.transparent,elevation: 0,
                          child: ListTile(leading: Container(height: 60,width: 60,decoration: BoxDecoration(
                            color: White,borderRadius: BorderRadius.all(Radius.circular(10)),

                          ),child: Icon(CupertinoIcons.line_horizontal_3_decrease_circle_fill,color: Primary,),),
                            title: AdminTitle('Show User'),subtitle: AdminSub('Show the current Users'),),
                        ),
                      ),
                    ],),
                  ),
                  Align(alignment: Alignment.center,
                    child: Container(decoration: BoxDecoration(color: White,borderRadius: BorderRadius.circular(10)),margin: EdgeInsets.only(top: 20),
                      child: AdminTitle('Admin Panel'),height: 50,width: 150,alignment: Alignment.center,),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}






