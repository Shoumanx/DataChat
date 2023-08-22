import 'package:flutter/material.dart';



void navigateLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  );
}
void navigateSign(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Sign()),
  );
}
void navigateUser(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Users()),
  );
}
void navigateAdmin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => chatApp()),
  );
}
void navigateDash(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => chatApp()),
  );
}