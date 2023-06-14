// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, no_leading_underscores_for_local_identifiers, unused_element, unused_local_variable, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:medi/db/model/model.dart';

import '../../db/functions/functions.dart';

final _profname = TextEditingController();
final _age = TextEditingController();
final _doctorname = TextEditingController();
final _doctorphone = TextEditingController();
final _gend = TextEditingController();
final _weight = TextEditingController();
final _height = TextEditingController();

final _items = ['Male', 'Female'];
String itemvalu = '';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 237, 249),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 81, 178, 234),
        actions: [
          IconButton(
              tooltip: 'Clear Profile',
              onPressed: () {
                deleteprof(0);
              },
              icon: Icon(Icons.clear_all_rounded))
        ],
        title: Text(
          'Profile',
          textScaleFactor: 1.5,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: profilelist,
          builder: (context, value, child) {
            if (profilelist.value.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        addp(context);
                      },
                      child: Text(
                        'Add Profile',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(50.0),
              child: Center(
                child: Container(
                  width: 500,
                  height: 600,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: <Color>[
                        Color.fromARGB(255, 65, 204, 255),
                        Color.fromARGB(255, 243, 241, 238)
                      ]),
                      color: Color.fromARGB(255, 150, 198, 237),
                      border: Border.all(width: 5, color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final data1 = value[index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Name: ${data1.profilename.toUpperCase()}',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Age: ${data1.age}',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Gender: ${data1.gender.toUpperCase()}',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Height: ${data1.height}',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Weight: ${data1.weight}',
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Doctor's Name: ${data1.doctorname.toUpperCase()}",
                                  style: TextStyle(fontSize: 20)),
                            ),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  "Doctor's Phone: ${data1.docphonenum}",
                                  style: TextStyle(fontSize: 20)),
                            )
                          ],
                        ),
                      );
                    },
                    itemCount: value.length,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

addp(BuildContext context) {
  showDialog(
      context: context,
      builder: (ctx) {
        return SimpleDialog(
          title: Text('Add Profile'),
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _profname,
                decoration: InputDecoration(
                    labelText: 'Name', border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _age,
                decoration: InputDecoration(
                    labelText: 'Age', border: OutlineInputBorder()),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: DropdownButtonFormField(
                  items: _items
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (value) {
                     itemvalu = value.toString();
                  },
                  decoration: InputDecoration(
                      labelText: 'Gender', border: OutlineInputBorder()),
                )),
                Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _height,
                decoration: InputDecoration(
                    labelText: "Height", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _weight,
                decoration: InputDecoration(
                    labelText: "Weight", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: _doctorname,
                decoration: InputDecoration(
                    labelText: "Doctor's Name", border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                controller: _doctorphone,
                decoration: InputDecoration(
                    labelText: "Doctor's Phonenumber",
                    border: OutlineInputBorder()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  onPressed: () {
                    onprof(context);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add')),
            )
          ],
        );
      });
}

Future<void> onprof(BuildContext context) async {
  final _pronameof = _profname.text;
  final _ageof = _age.text;
  final _docnameof = _doctorname.text;
  final _docphonenumberof = _doctorphone.text;
  final _genof = itemvalu;
  final _weiof = _weight.text;
  final _heiof = _height.text;
  if (_pronameof.isEmpty ||
      _ageof.isEmpty ||
      _docnameof.isEmpty ||
      _docphonenumberof.isEmpty || _heiof.isEmpty || _weiof.isEmpty || _genof.isEmpty) {
    return;
  }

  final _profile = Model1(
      profilename: _pronameof,
      id1: null,
      age: _ageof,
      doctorname: _docnameof,
      docphonenum: _docphonenumberof,
      height: _heiof,
      weight: _weiof,
      gender: _genof);
  addprof(_profile);
}
