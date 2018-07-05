//import 'package:flutter/material.dart';
//import 'dart:async';
//
//class RegisterPage extends StatefulWidget {
//  @override
//  _RegisterPageState createState() => _RegisterPageState();
//}
//
//class _RegisterPageState extends State<RegisterPage> {
//  DateTime _dob;
//  DateTime _now = DateTime.now();
//  Future<Null> _selectDOB(BuildContext context) async {
//    final DateTime picked = await showDatePicker(
//        context: context,
//        initialDate: _now,
//        firstDate: DateTime(1999),
//        lastDate: _now
//    );
//    if(picked != null){
//      setState(() {
//        _dob = picked;
//      });
//    }
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: _buildRegisterPage(),
//    );
//  }
//
//
//
//  Widget _buildRegisterPage() {
//    return PageView(
//      children: <Widget>[
//        _buildPage1(),
//        _buildPage2(),
//        _buildPage3(),
//      ],
//    );
//  }
//
//  Widget _buildPage1() {
//    return ListView(
//      shrinkWrap: true,
//      padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 100.0),
//      children: <Widget>[
//        _buildField('First name', TextInputType.text),
//        SizedBox(height: 15.0),
//        _buildField('Last name', TextInputType.text),
//        SizedBox(height: 15.0),
//        _buildField('Birth year', TextInputType.datetime),
//        SizedBox(height: 15.0),
//        _DOBField()
//      ],
//    );
//  }
//
//  Widget _buildPage2() {}
//
//  Widget _buildPage3() {}
//
//  Widget _DOBField(){
//    return Material(
//      borderRadius: BorderRadius.circular(30.0),
//      shadowColor: Colors.lightBlueAccent.shade100,
//      elevation: 5.0,
//      child: MaterialButton(
//        minWidth: 200.0,
//        height: 40.0,
//        onPressed: (){
//          _selectDOB(context);
//        },
//        color: Colors.lightBlueAccent,
//        child: Text(
//          _dob==null?'Pick date of birth':_dob.toString(),
//          style: TextStyle(
//              color: Colors.white
//          ),
//        ),
//      ),
//    );
//  }
//
//  Widget _buildField(String hint, var textInputType){
//    return TextFormField(
//      keyboardType: textInputType,
//      autofocus: false,
//      decoration: InputDecoration(
//          hintText: hint,
//          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//          border: OutlineInputBorder(
//              borderRadius: BorderRadius.circular(32.0)
//          )
//      ),
//    );
//  }
//}
