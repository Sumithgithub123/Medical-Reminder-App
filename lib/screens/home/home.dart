// ignore_for_file: sized_box_for_whitespace, unused_field, prefer_const_constructors_in_immutables, must_be_immutable, prefer_const_constructors, unused_local_variable, unused_import, avoid_print, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:medi/db/functions/functions.dart';
import 'package:medi/screens/calendar.dart';
import 'package:medi/screens/home/widgets/bottomsheet.dart';
import 'package:medi/services/notification_services.dart';
import 'package:medi/screens/home/bmi.dart';
import 'package:medi/screens/home/profile.dart';

class Homescreen extends StatelessWidget {
  Homescreen({super.key});

  final FlutterTts fluttertts = FlutterTts();

  speak(String text) async {
    await fluttertts.setLanguage("en");
    await fluttertts.setPitch(1.0);
    await fluttertts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return Calenderinfo();
              }));
            },
            icon: Icon(Icons.calendar_month)),
        actions: [
          IconButton(
              onPressed: () {
                SystemNavigator.pop();
              },
              icon: Icon(Icons.exit_to_app))
        ],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25))),
        title: Text(
          'MEDICINE REMAINDER',
          textScaleFactor: 1.2,
        ),
        toolbarHeight: 80,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: remainderlist,
          builder: (context, value, child) {
            if (remainderlist.value.isEmpty) { 
              return Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/output-onlinegiftools.gif',
                      width: 70,
                      height: 70,
                      opacity: AlwaysStoppedAnimation(400)),
                  Text(
                    'No Remainders Added Yet!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ));
            }
            return ListView.separated(
                controller: PageController(),
                itemBuilder: (ctx, index) {
                  final data = value[index];
                  return ListTile(
                    onLongPress: () => speak(data.name),
                    onTap: () {},
                    title: Text(
                      'Name: ${data.name.toUpperCase()}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text('Dose: ${data.dose}',
                        style: TextStyle(
                          color: Colors.black,
                            fontSize: 18, fontWeight: FontWeight.w500)),
                    leading: Text(data.timeset!,style: TextStyle(fontWeight:FontWeight.w500),),
                    trailing: IconButton(
                        tooltip: 'Delete Remainders',
                        onPressed: () async {
                          await deleterem(index, data.idd!);
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const Divider();
                },
                itemCount: value.length);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        onPressed: () {
          bottomsheetshow(context);
        },
        tooltip: 'Add Remainders',
        child: const Icon(Icons.add),
      ),
    );
  }
}
