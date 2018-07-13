import 'package:flutter/material.dart';
import 'package:rigolth_app_v0/dokterku/rs_page.dart';
import 'package:rigolth_app_v0/models/doctor.dart';
import 'package:rigolth_app_v0/models/RS.dart';
import 'package:rigolth_app_v0/components/components.dart';
import 'package:rigolth_app_v0/dummydata/dummy_data.dart';

enum TabFilter {Terdekat, RumahSakit, Spesialis}

class DokterkuHomePage extends StatefulWidget {
  @override
  _DokterkuHomePageState createState() => _DokterkuHomePageState();
}

class _DokterkuHomePageState extends State<DokterkuHomePage>
    with TickerProviderStateMixin{

  TabFilter _tabFilter;

  bool _searchActive;

  TabController _tabControllerTampilan;

  TabController _tabControllerFilter;

  TextEditingController _fieldSearchController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchActive = false;
    _tabFilter = TabFilter.Terdekat;

    _tabControllerTampilan = TabController(
        vsync: this,
        length: 2,
        initialIndex: 0
    );
    _tabControllerFilter = TabController(
        vsync: this,
        length: 3,
        initialIndex: 0
    );
    _tabControllerFilter.addListener((){
      setState(() {
        if(_tabControllerFilter.index==0){
          _tabFilter = TabFilter.Terdekat;
        }else if(_tabControllerFilter.index==1){
          _tabFilter = TabFilter.RumahSakit;
        }else{
          _tabFilter = TabFilter.Spesialis;
        }
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Color(0xFFF2F0FF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30.0),
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                  begin: Alignment(-0.25,-2.0),
                  end: Alignment(0.2,2.0), // 10% of the width, so there are ten blinds.
                  colors: [const Color(0xFF7C83F3), const Color(0xFF7297F4), const Color(0xFF45D2DF), const Color(0xFF45D2DF)], // whitish to gray
                  tileMode: TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                      width: double.infinity,
                      height: 50.0,
                      padding: EdgeInsets.only(top: 10.0, right: 20.0, left: 20.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                          color: Colors.white,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              _searchActive?Container():Container(
                                  padding: EdgeInsets.only(top: 0.0),
                                  child: Icon(
                                      Icons.menu
                                  )
                              ),
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                                  child: TextField(
//                                    focusNode: _focusNodeSearch,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Colors.black45
                                    ),
                                    controller: _fieldSearchController,
                                    decoration: InputDecoration(
                                        hintText: 'Cari Dokter',
                                        hintStyle: TextStyle(
                                          fontSize: 15.0,
                                        )

                                    ),
                                  ),
                                ),
                              ),
                              _searchActive?Container():Container(
                                padding: EdgeInsets.symmetric(horizontal: 0.0, vertical: 10.0),
                                child: Image(
                                  image: AssetImage('assets/search_bottom_menu_2.png'),
                                  color: Colors.black54,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  Container(
                    child: TabBar(
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      controller: _tabControllerTampilan,
                      indicatorColor: Colors.white,
                      indicatorPadding: EdgeInsets.symmetric(horizontal: 12.0),
                      tabs: <Widget>[
                        Tab(
                          child: Container(
                            child: Text(
                              'Tampilan List'.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 10.0
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Tampilan Maps'.toUpperCase(),
                            style: TextStyle(
                                fontSize: 10.0
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabControllerTampilan,
                children: <Widget>[
                  _buildTampilanList(),
                  Container()
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        elevation: 5.0,
        child: Container(
          padding: EdgeInsets.all(14.0),
          child: Image(
            image: AssetImage('assets/sort_bottom_menu_2.png'),
          ),
        ),
        onPressed: (){
          // TODO
        },
      ),
    );
  }


  @override
  void dispose() {
    // TODO: implement dispose
    _tabControllerTampilan.dispose();
    _tabControllerFilter.dispose();
    _fieldSearchController.dispose();
    super.dispose();
  }


  Widget _buildTampilanList() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  controller: _tabControllerFilter,
                  tabs: <Widget>[
                    Tab(
                      child: FlatButton(
                        child: Image(
                          image: AssetImage('assets/dokterku_terdekat_blue.png'),
                          height: 30.0,
                          width: 30.0,
                          color: _tabFilter==TabFilter.Terdekat?null:Colors.black38,
                        ),
                      ),
                    ),
                    Tab(
                      child: FlatButton(
                        child: Image(
                          image: AssetImage('assets/dokterku_rumahsakit_blue.png'),
                          height: 40.0,
                          width: 40.0,
                          color: _tabFilter==TabFilter.RumahSakit?null:Colors.black38,
                        ),
                      ),

                    ),
                    Tab(
                      child: FlatButton(
                        child: Image(
                          image: AssetImage('assets/dokterku_spesialis_blue.png'),
                          height: 27.0,
                          width: 27.0,
                          color: _tabFilter==TabFilter.Spesialis?null:Colors.black38,
                        ),
                      ),
                    ),
                  ],
                ),
              )
          ),//at here
          new Expanded(
              child: TabBarView(
                controller: _tabControllerFilter,
                children: <Widget>[
                  _buildListDoctorTerdekat(dummyDoctors),
                 _buildListDoctorRumahSakit(dummyRS),
                  _buildListDoctorSpecialist(dummyDoctors),
                 // Container()
                ],
              )
          )
        ],
      ),
    );
  }

  Widget _buildListDoctorSpecialist(List<Doctor> doctors){
    List<String> specialists = List<String>();
    for(int i = 0; i<doctors.length; i++){
      specialists.add(doctors[i].specialist);
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _buildSpecialistList(specialists),
          _buildListDoctorSpecialistList(doctors)
        ],
      ),
    );
  }

  Widget _buildListDoctorSpecialistList(List<Doctor> doctors) {
    return Expanded(
      child: ListView.builder(
        itemCount: doctors.length+1,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, i){
          return Container(
            padding: i==0?null:i==1?EdgeInsets.only(bottom: 4.0):EdgeInsets.symmetric(vertical: 4.0),
            child: i==0?_buildListTitle('Daftar Spesialis', 'Menampilkan rekomendasi spesialisasi')
                :SpecialistContainDoctorCard(doctors: doctors,),
          );
        },
      ),
    );
  }

  Widget _buildSpecialistList(List<String> specialists){
    return Container(
      height: 49.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: specialists.length,
        itemBuilder: (contextt, i){
          return Container(
            padding: i==0?
                      EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0, right: 6.0)
                      :
                    i==specialists.length-1?
                    EdgeInsets.only(top: 12.0, bottom: 12.0, left: 6.0, right: 16.0)
                    :
                    EdgeInsets.symmetric(horizontal: 6.0, vertical: 12.0),
            child: _buildSpecialistLabel(specialists[i]),
          );
        }
      )
    );
  }

  Widget _buildSpecialistLabel(String specialist) {
    return Material(
      borderRadius: BorderRadius.circular(16.0),
      color: const Color(0xFF45D2DF),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 6.0),
        child: Text(
          specialist.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 12.0
          ),
        ),
      )
    );
  }

  Widget _buildListDoctorTerdekat(List<Doctor> doctors){
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

  Widget _buildListDoctorRumahSakit(List<RS> RSs){
    return Container(
      child: ListView.builder(
        padding: EdgeInsets.only(top: 10.0),
        itemCount: RSs.length+1,
        itemBuilder: (context, i){
          return Padding(
              padding: i==0?EdgeInsets.only(left: 20.0, right: 20.0, bottom: 0.0)
                  :
              EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
              child: i==0?
              _buildListTitle('Daftar Rumah Sakit','Menampilan daftar dokter berdasarkan rumahsakit')
                  :
              RSContainDoctorsCard(rs: RSs[i-1], onPressed: (){
                var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                  RSPage(rs: RSs[i-1]),
                );
                Navigator.of(context).push(route);
              })
          );
        },
      )
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








