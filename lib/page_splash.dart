import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rigolth_app_v0/page_login.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), ()=>
        Navigator.of(context).push(
            MaterialPageRoute(
                builder: (BuildContext context) => LoginPage()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:  Hero(
            tag: 'logo',
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 64.0,
              child: Image.asset('assets/logo.png'),
            ),
          )
      ),
    );
  }
}
