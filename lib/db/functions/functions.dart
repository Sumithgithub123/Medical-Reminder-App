// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member, unrelated_type_equality_checks, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hive/hive.dart';
import 'package:medi/db/model/model.dart';
import 'package:medi/screens/home/widgets/bottomsheet.dart';

import '../../services/notification_services.dart';

ValueNotifier<List<Model>> remainderlist = ValueNotifier([]);

ValueNotifier<List<Model1>> profilelist = ValueNotifier([]);

void addremainder(Model value) async {
  final remaindb = await Hive.openBox<Model>('remdb');
  final _key = await remaindb.add(value);
  remaindb.put(_key, value);
  value.idd = _key;
  Notificationservices().schedulenotification(
      id: value.idd!,
      title: value.name.toUpperCase(),
      body: value.dose,
      schedulenotificationdatetime: scheduletime);
  remainderlist.value.add(value);
  remainderlist.notifyListeners();
}

Future<void> getallrem() async {
  final remaindb = await Hive.openBox<Model>('remdb');
  remainderlist.value.clear();
  remainderlist.value.addAll(remaindb.values);
  remainderlist.notifyListeners();
}

Future<void> deleterem(int idd, int id) async {
  final remaindb = await Hive.openBox<Model>('remdb');
  FlutterLocalNotificationsPlugin().cancel(id);
  print(id);
  remaindb.deleteAt(idd);
  getallrem();
}

void addprof(Model1 value) async {
  final profdb = await Hive.openBox<Model1>('profdb');
  final _key = await profdb.add(value);
  profdb.put(_key, value);
  value.id1 = _key;
  profilelist.value.add(value);
  profilelist.notifyListeners();
}

Future<void> getallprof() async {
  final profdb = await Hive.openBox<Model1>('profdb');
  profilelist.value.clear();
  profilelist.value.addAll(profdb.values);
  profilelist.notifyListeners();
}

Future<void> deleteprof(int id1) async {
  final profdb = await Hive.openBox<Model1>('profdb');
  profdb.deleteAt(id1);
  getallprof();
}
