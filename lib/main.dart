import 'package:flutter/material.dart';
import 'package:rogolth_app_v0/dokterku/home_page.dart';
//import 'package:rigolth_app_v0/page_login.dart';
//import 'package:rigolth_app_v0/page_splash.dart';
//import 'package:rigolth_app_v0/page_register.dart';


void main()=>runApp(
  RigolthApp()
);

class RigolthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rigotlh App',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito'
      ),
      home: DokterkuHomePage(),
      //home: LoginPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}
