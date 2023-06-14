import 'package:hive/hive.dart';
part 'model.g.dart';

@HiveType(typeId: 1)
class Model {
  @HiveField(0)
  int? idd;
  @HiveField(1)
  final String name;
  @HiveField(2)
  final String dose;
  @HiveField(3)
  String? timeset;
  Model(
      {required this.name,
      required this.dose,
      required this.idd,
      required this.timeset});
}

@HiveType(typeId: 2)
class Model1 {
  @HiveField(0)
  final String profilename;
  @HiveField(1)
  final String age;
  @HiveField(2)
  int? id1;
  @HiveField(3)
  final String doctorname;
  @HiveField(4)
  final String docphonenum;
  @HiveField(5)
  final String gender;
  @HiveField(6)
  final String height;
  @HiveField(7)
  final String weight;
  Model1(
      {required this.profilename,
      required this.id1,
      required this.age,
      required this.doctorname,
      required this.docphonenum,required this.gender,required this.weight,required this.height});
}
