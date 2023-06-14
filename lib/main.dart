// ignore_for_file: depend_on_referenced_packages, unnecessary_import, unused_import
import 'package:flutter/material.dart';
import 'package:medi/db/model/model.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive/hive.dart';
import 'package:medi/screens/splash.dart';
import 'package:medi/services/notification_services.dart';
import 'package:medi/screens/home/home.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:table_calendar/table_calendar.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(ModelAdapter().typeId)) {
    Hive.registerAdapter(ModelAdapter());
  }
   if (!Hive.isAdapterRegistered(Model1Adapter().typeId)) {
    Hive.registerAdapter(Model1Adapter());
  }
  Notificationservices().initNotification();
  tz.initializeTimeZones();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}
