import 'package:flutter/material.dart';
import 'package:rigolth_app_v0/components/components.dart';
import 'package:rigolth_app_v0/models/RS.dart';
import 'package:rigolth_app_v0/models/doctor.dart';
class RSPage extends StatelessWidget {
  final RS rs;
  RSPage({Key key, this.rs}):super (key:key);
  //back button key
  static final backButtonKey = const Key('back_button_key');
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
                            rs.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                            textAlign: TextAlign.end,
                          ),
                          Text(
                            rs.location,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
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
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                      automaticallyImplyLeading: false,
                      expandedHeight: 185.0,
                      floating: false,
                      pinned: false,
                      backgroundColor: Colors.transparent,
                      flexibleSpace: FlexibleSpaceBar(
                        background: Image(
                          width: double.infinity,
                          image: AssetImage('assets/dummyrs.png'),
                          fit: BoxFit.cover,
                          color: Colors.black12,
                          colorBlendMode: BlendMode.overlay,
                        ),
                        title: Transform.translate(
                          offset: Offset(-30.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //doc n special
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    //doc
                                    Container(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          //icon
                                          Container(
                                            child: Image(
                                              image: AssetImage('assets/dokterku_rumahsakit_jumlahdokter.png'),
                                              height: 15.0,
                                            ),
                                          ),
                                          SizedBox(width: 10.0,),
                                          Container(
                                            child: Text(
                                              rs.doctors.length.toString()+' dokter',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10.0
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 22.0,),
                                    Container(
                                      child: Row(
                                        children: <Widget>[
                                          //icon
                                          Container(
                                            child: Image(
                                              image: AssetImage('assets/dokterku_rumahsakit_jumlahspesialis.png'),
                                              height: 12.0,
                                            ),
                                          ),
                                          SizedBox(width: 10.0,),
                                          Container(
                                            child: Text(
                                              rs.specialistCount.toString()+' jenis spesialis',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 10.0
                                              ),
                                            ),
                                          )
                                          //bla spe
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 7.0,),
                              //location
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      child: Image(
                                        image: AssetImage('assets/dokterku_rumahsakit_lokasirumahsakit.png'),
                                        height: 17.0,
                                      ),
                                    ),
                                    SizedBox(width: 10.0,),
                                    Container(
                                      child: Text(
                                        rs.longLocation.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 7.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  Container(
                    child: SliverList(
                      delegate: SliverChildBuilderDelegate((context, i){
                        return Padding(
                            padding: i==0?EdgeInsets.only(top:12.0, left: 16.0, right: 16.0, bottom: 0.0)
                                :
                            EdgeInsets.only(left: 16.0, right: 16.0, bottom: 10.0),
                            child: i==0?
                            _buildListTitle('Daftar Dokter','Menampilan daftar dokter terdekat')
                                :
                            DoctorCard(
                              name: rs.doctors[i-1].name,
                              experience: rs.doctors[i-1].experience,
                              location: rs.doctors[i-1].location,
                              practice: rs.doctors[i-1].practice,
                              specialist: rs.doctors[i-1].specialist,
                            )
                        );
                      },childCount: rs.doctors.length+1),
                    ),
                  ),
//          Container(
//            height: 100.0,
//            width: double.infinity,
//            child: Text('halo'),
//          )
                ],
              ),
            )
          ],
        ),
      )
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
              _buildListTitle('Daftar Dokter','Menampilan daftar dokter terdekat')
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
