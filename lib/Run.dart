import 'package:datachat/Pages/Delete.dart';
import 'package:datachat/Pages/Show.dart';
import 'package:flutter/material.dart';
import 'package:datachat/Pages/Admin.dart';
import 'package:datachat/Pages/Update.dart';
import 'Pages/Users.dart';
import 'Pages/Login.dart';
import 'package:datachat/Pages/SignUp.dart';


main(){
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Login(),
      )
  );
}