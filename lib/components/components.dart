import 'package:flutter/material.dart';
import 'package:rigolth_app_v0/models/RS.dart';
import 'package:rigolth_app_v0/models/doctor.dart';

class SpecialistContainDoctorCard extends StatelessWidget {

  List<Doctor> doctors;
  SpecialistContainDoctorCard({this.doctors});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      elevation: 1.0,
      child: Container(
        height: 155.0,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Text(
                      doctors[0].specialist.toString(),
                      style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 14.0
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Selengkapnya',
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 10.0
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: doctors.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, i){
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 4.0),
                    child: DoctorCard3(doctors: doctors,),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}


class DoctorCard3 extends StatelessWidget {
  List<Doctor> doctors;
  DoctorCard3({this.doctors});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      elevation: 0.0,
      child: Container(
        width: 120.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 55.0,
              color: Colors.grey,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                child: Text(
                  doctors[1].name,
                  style: TextStyle(
                    color: Colors.lightBlue,
                    fontSize: 9.0,
                  ),
                )
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 4.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Spesialis:', style: TextStyle(fontSize: 5.0)),
                      SizedBox(height: 2.0),
                      Text('Pengalaman:', style: TextStyle(fontSize: 5.0)),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(doctors[1].specialist, style: TextStyle(fontSize: 5.0, color: Color(0xFF7297F4))),
                      SizedBox(height: 2.0),
                      Text(doctors[1].experience, style: TextStyle(fontSize: 5.0, color: Color(0xFF7297F4))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.0,),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 7.0,
                  ),
                  SizedBox(width: 4.0,),
                  Text(doctors[1].location, style: TextStyle(fontSize: 5.0, color: Colors.black))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}



class RSContainDoctorsCard extends StatelessWidget {
  final RS rs;
  final Function onPressed;
  RSContainDoctorsCard({this.rs, this.onPressed});
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12.0),
      elevation: 0.5,
      child: Container(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/dummyrs.png'),
                  width: double.infinity,
                  height: 100.0,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                Container(
                  child: Container(
                    height: 115.0,
                  ),
                )
              ],
            ),
            Container(
              height: 215.0,
              //color: Colors.green,
              child: Column(
                children: <Widget>[
                  Container(
                    //color: Colors.green,
                    padding: EdgeInsets.only(top: 14.0, left: 16.0, right: 16.0, bottom: 2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                            rs.name,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        FlatButton(
                          child: Text(
                              'Lihat Detail',
                            style: TextStyle(
                                color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 8.0
                            ),
                          ),
                          onPressed: onPressed,
                        )
                      ],
                    ),
                  ),
                  //line
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      color: Colors.white,
                      height: 0.5,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 4.0, right: 16.0, left: 16.0),
                    child: _buildRSSummary(rs),
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: rs.doctors.length,
                      itemBuilder: (context, i){
                        EdgeInsets headEdgeInsets = EdgeInsets.only(left: 16.0, right: 4.0);
                        EdgeInsets tailEdgeInsets = EdgeInsets.only(right: 16.0, left: 4.0);
                        return Container(
                          padding: i==0?headEdgeInsets:i==rs.doctors.length-1
                              ?tailEdgeInsets:EdgeInsets.symmetric(horizontal: 4.0),
                          //padding: EdgeInsets.symmetric(horizontal: 4.0),
                          child: DoctorCard2(
                            name: rs.doctors[i].name,
                            specialist: rs.doctors[i].specialist,
                            experience: rs.doctors[i].experience,
                            location: rs.doctors[i].location,
                            practice: rs.doctors[i].practice,
                          ),
                        );
                      },

                    ),
                  )
                ],
              ),
            )
          ],
        )
      ),
    );
  }


  Widget _buildRSSummary(RS rs){
    String doctorIconPath = 'assets/dokterku_rumahsakit_jumlahdokter.png';
    String doctorIconText = rs.doctors.length.toString() + ' dokter';
    String specialistIconPath = 'assets/dokterku_rumahsakit_jumlahspesialis.png';
    String specialistIconText = rs.doctors.length.toString() + ' spesialis';
    return Container(
      child: Row(
        children: <Widget>[
          _buildIconText(doctorIconPath, doctorIconText),
          SizedBox(width: 20.0,),
          _buildIconText(specialistIconPath, specialistIconText),
          Expanded(child: Container(),),
          _buildStarRate(rs.rate)
        ],
      ),
    );
  }

  _buildStarRate(int rate){
    return Container(
      child: Row(
        children: <Widget>[
          _buildStarIcon(rate>0),
          _buildStarIcon(rate>1),
          _buildStarIcon(rate>2),
          _buildStarIcon(rate>3),
          _buildStarIcon(rate>4)
        ],
      ),
    );
  }

  Widget _buildStarIcon(bool isFilled){
    return Container(
      child: Image(
        image: isFilled?
          AssetImage('assets/filled_star.png')
          :
          AssetImage('assets/no_fill_star.png'),
        height: 12.0,
      ),
    ) ;
  }

  Widget _buildIconText(String iconPath, String iconText){
    return Container(
      child: Row(
        children: <Widget>[
          //icon
          Container(
            child: Image(
              image: AssetImage(iconPath),
              height: 12.0,
            )
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              iconText,
              style: TextStyle(
                color: Colors.white,
                fontSize: 10.0
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DoctorCard2 extends StatelessWidget {
  final name;
  final specialist;
  final practice;
  final experience;
  final location;
  DoctorCard2({this.name, this.specialist, this.practice, this.experience, this.location});
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Container(
        height: double.infinity,
        width: 140.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //foto
            Container(
              color: Colors.grey,
              height: 70.0,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                name,
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontSize: 10.0,
                ),
              )
            ),
            Container(
              padding: EdgeInsets.only(left: 16.0, right: 4.0),
              child: Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Spesialis:', style: TextStyle(fontSize: 6.0)),
                      SizedBox(height: 3.0),
                      Text('Pengalaman:', style: TextStyle(fontSize: 6.0)),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(specialist, style: TextStyle(fontSize: 6.0, color: Color(0xFF7297F4))),
                      SizedBox(height: 3.0),
                      Text(experience, style: TextStyle(fontSize: 6.0, color: Color(0xFF7297F4))),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0,),
            Container(
              padding: EdgeInsets.only(left: 16.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    size: 8.0,
                  ),
                  SizedBox(width: 4.0,),
                  Text(location, style: TextStyle(fontSize: 6.0, color: Colors.black))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


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
                                fontSize: 15.0
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
                                fontSize: 9.0,
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
                                  Text('Spesialis:', style: TextStyle(fontSize: 9.0)),
                                  SizedBox(height: 3.0),
                                  Text('Praktik:', style: TextStyle(fontSize: 9.0)),
                                  SizedBox(height: 3.0),
                                  Text('Pengalaman:', style: TextStyle(fontSize: 9.0)),
                                ],
                              ),
                              SizedBox(width: 10.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(specialist, style: TextStyle(fontSize: 9.0, color: Color(0xFF7297F4))),
                                  SizedBox(height: 3.0),
                                  Text(practice, style: TextStyle(fontSize: 9.0, color: Color(0xFF7297F4))),
                                  SizedBox(height: 3.0),
                                  Text(experience, style: TextStyle(fontSize: 9.0, color: Color(0xFF7297F4))),
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
                              Text(location, style: TextStyle(fontSize: 9.0, color: Colors.black))
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


