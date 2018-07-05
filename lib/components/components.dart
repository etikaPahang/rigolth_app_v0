import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final name;
  final specialist;
  final practice;
  final experience;
  final location;
  DoctorCard({this.name, this.specialist, this.practice, this.experience, this.location});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        padding: EdgeInsets.only(bottom: 0.0),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          child: Text(
                            name,
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 12.0
                            ),
                          )
                      ),
                      Expanded(
                        child: Container(),
                      ),
                      Container(
                          child: Text(
                            'Lihat Detail',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 8.0,
                                fontWeight: FontWeight.bold
                            ),
                          )
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(3.0),
                        child: Container(
                          color: Colors.grey,
                          height: 55.0,
                          width: 85.0,
                        ),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(height: 3.0),
                          Row(
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Spesialis:', style: TextStyle(fontSize: 8.0)),
                                  SizedBox(height: 3.0),
                                  Text('Praktik:', style: TextStyle(fontSize: 8.0)),
                                  SizedBox(height: 3.0),
                                  Text('Pengalaman:', style: TextStyle(fontSize: 8.0)),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(specialist, style: TextStyle(fontSize: 8.0, color: Color(0xFF7297F4))),
                                  SizedBox(height: 3.0),
                                  Text(practice, style: TextStyle(fontSize: 8.0, color: Color(0xFF7297F4))),
                                  SizedBox(height: 3.0),
                                  Text(experience, style: TextStyle(fontSize: 8.0, color: Color(0xFF7297F4))),
                                ],
                              )
                            ],
                          ),
                          SizedBox(height: 5.0,),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.location_on,
                                size: 15.0,
                              ),
                              Text(location, style: TextStyle(fontSize: 8.0, color: Colors.black))
                            ],
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

