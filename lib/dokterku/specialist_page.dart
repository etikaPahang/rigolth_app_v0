import 'package:flutter/material.dart';
import 'package:rigolth_app_v0/components/components.dart';
import 'package:rigolth_app_v0/models/doctor.dart';
import 'package:rigolth_app_v0/dummydata/dummy_data.dart';

class SpecialistPage extends StatelessWidget {
  final Key backButtonKey = Key('back_button_key');
  final List<Doctor> doctors;
  SpecialistPage({this.doctors});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment(-0.15,-2.0),
                  end: Alignment(0.2,2.0), // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFF7C83F3), const Color(0xFF7297F4), const Color(0xFF45D2DF), const Color(0xFF45D2DF)], // whitish to gray
                  tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              height: 92.0,
              child: Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 40.0,
                      height: double.infinity,
                      child: Transform.scale(
                        scale: 1.0,
                        child: FlatButton(
                          key: backButtonKey,
                          child: Image(
                            image: AssetImage('assets/back_taskbar.png'),
                          ),
                          onPressed: (){
                            //TODO:
                            Navigator.of(context).pop(true);
                          },
                        ),
                      ),
                    ),
                    Expanded(child: Container(),),
                    Container(
                      padding: EdgeInsets.only(right: 20.0, top: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text(
                            'Spesialis Anak',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold
                            ),
                            textAlign: TextAlign.end,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: _buildListDoctor(doctors),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildListDoctor(List<Doctor> doctors){
    return Container(
      child: ListView.builder(
          padding: EdgeInsets.only(top: 10.0),
          itemCount: doctors.length+1,
          itemBuilder: (context, i){
            return Padding(
                padding: i==0?EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0.0)
                    :
                EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
                child: i==0?
                _buildListTitle('Daftar Dokter','Menampilan daftar dokter spesialis anak')
                    :
                DoctorCard(
                  name: doctors[i-1].name,
                  experience: doctors[i-1].experience,
                  location: doctors[i-1].location,
                  practice: doctors[i-1].practice,
                  specialist: doctors[i-1].specialist,
                )
            );
          }
      ),
    );
  }
  
  Widget _buildListTitle(String title, String subtitle){
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget >[
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black54,
            ),
          ),
          Text(
            subtitle,
            style: TextStyle(
                fontSize: 12.0,
                color: Colors.black54
            ),
          ),
          SizedBox(height: 20.0,)
        ],
      ),
    );
  }
}
