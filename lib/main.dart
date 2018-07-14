import 'package:flutter/material.dart';
import 'package:rigolth_app_v0/dokterku/home_page.dart';
import 'package:rigolth_app_v0/dokterku/rs_page.dart';
import 'package:rigolth_app_v0/dummydata/dummy_data.dart';
import 'package:rigolth_app_v0/dokterku/specialist_page.dart';


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
      //home: SpecialistPage(doctors: dummyDoctors),
      home: DokterkuHomePage(),
//      home: RSPage(
//        rs: dummyRS[0]
//      ),//DokterkuHomePage(),
      //home: LoginPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}
