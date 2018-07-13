import 'package:rigolth_app_v0/models/doctor.dart';
class RS{
  final String name;
  final List<Doctor> doctors;
  final int specialistCount;
  final int rate;
  final String location;
  final String longLocation;
  RS({this.name, this.doctors, this.specialistCount, this.rate, this.location, this.longLocation});
}