import 'package:flutter/material.dart';
import '../Admin.dart';
import '../Delete.dart';
import '../Update.dart';
import '../Login.dart';
import '../SignUp.dart';
import '../Users.dart';
import '../Show.dart';



void navigateToUsers(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Users()),
  );
}
void navigateToLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}
void navigateToShow(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Show()),
  );
}
void navigateToUpdate(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Update()),
  );
}
void navigateToDelete(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Delete()),
  );
}
void navigateToSign(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Sign()),
  );
}
void navigateToAdmin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Admin()),
  );
}