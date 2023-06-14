// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_element, unused_local_variable, no_leading_underscores_for_local_identifiers, unused_import, prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:medi/db/functions/functions.dart';
import 'package:medi/db/model/model.dart';
import 'package:medi/screens/home/home.dart';
import 'package:medi/services/notification_services.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:intl/intl.dart';

final _name = TextEditingController();
final _dose = TextEditingController();

var scheduletime;
final _formkey = GlobalKey<FormState>();

TimeOfDay? timeOfDay = TimeOfDay(hour: 0, minute: 00);
final ValueNotifier<TimeOfDay?> time = ValueNotifier(timeOfDay!);

Future<void> bottomsheetshow(BuildContext context) async {
  await showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(100))),
      context: context,
      builder: (ctx) {
        return Form(
          key: _formkey,
          child: Container(
            padding: EdgeInsets.all(15.0),
            height: 500,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Row(
                    children: const [
                      Text(
                        'Add New Medicine',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _name,
                    decoration: InputDecoration(
                      label:Text('Name'),
                        focusedBorder: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Medicine Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _dose,
                    decoration: InputDecoration(
                      label: Text('Dose'),
                        focusedBorder: OutlineInputBorder()),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Medicine Dosage';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            DatePicker.showDateTimePicker(
                              context,
                              showTitleActions: true,
                              onChanged: (date) => scheduletime = date,
                              onConfirm: (date) {},
                            );
                          },
                          child: Text(
                            'Set Time',
                            style: TextStyle(fontSize: 17),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Text('Hint: Must be a time in the future!')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size(40, 28))),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child:
                              Text('CANCEL', style: TextStyle(fontSize: 15.0))),
                      SizedBox(
                        width: 10,
                      ),
                      ElevatedButton(
                          style: ButtonStyle(
                              minimumSize:
                                  MaterialStatePropertyAll(Size(10, 28))),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              onaddrem(context);
                              Navigator.pop(context);
                            }
                          },
                          child: Text(
                            'OK',
                            style: TextStyle(fontSize: 15.0),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      });
}

Future<void> onaddrem(BuildContext context) async {
  String formatted = DateFormat('dd-MM-yyyy\nhh:mm aa').format(scheduletime);
  final _nameof = _name.text;
  final _doseof = _dose.text;
  final _timeof = formatted;
  if (_nameof.isEmpty || _doseof.isEmpty) {
    return;
  }

  final _remainder =
      Model(name: _nameof, dose: _doseof, idd: null, timeset: _timeof);

  addremainder(_remainder);
}
