// ignore_for_file: prefer_const_constructors, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_const_constructors_in_immutables, unnecessary_string_interpolations, unnecessary_null_comparison

import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  Bmi({super.key});

  @override
  State<Bmi> createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  final TextEditingController _heightc = TextEditingController();

  final TextEditingController _weightv = TextEditingController();
  double _result = 0.0;
  Color mycolor = Colors.transparent;
  String hi = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Body Mass Index Calculator',textScaleFactor: 1.1,),centerTitle: true,backgroundColor: Color.fromARGB(255, 75, 142, 193),),
        body: Container(
          color: Color.fromARGB(255, 123, 166, 166),
       padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            style: TextStyle(fontSize: 18),
            controller: _heightc,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
                labelText: 'Height (in cm)', icon: Icon(Icons.trending_up)),
          ),
          SizedBox(height: 20),
          TextField(
            style: TextStyle(fontSize: 18),
            controller: _weightv,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
                labelText: 'Weight (in kg)', icon: Icon(Icons.line_weight)),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style:ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(10, 30))),
              onPressed: () {
                calcBMI();
              },
              child: Text('Check',style: TextStyle(fontSize: 18),)),
          SizedBox(height: 40),
          Container(
            alignment: Alignment.center,
            width: 200,
            height: 60,
            decoration: BoxDecoration(
                color: mycolor,
                borderRadius: BorderRadius.all(Radius.circular(12))),
            child: Text(
              _result.toStringAsFixed(2),
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 20),
          Text(
            hi,
            style: TextStyle(color: mycolor, fontWeight: FontWeight.bold,fontSize: 18),
          )
        ],
      ),
    ));
  }

  calcBMI() {
    double height = double.parse(_heightc.text) / 100;
    double weight = double.parse(_weightv.text);
    double heightsq = height * height;
    double result = weight / heightsq;
    _result = result;
    setState(() {
      if (_result < 18.5) {
        mycolor = Color.fromARGB(255, 79, 159, 233);
        hi = 'You are UNDERWEIGHT!';
      } else if (_result >= 18.5 && _result <= 24.9) {
        mycolor = Color.fromARGB(255, 46, 232, 95);
        hi = 'NORMAL';
      } else if (_result >= 25 && _result <= 29.9) {
        mycolor = Color(0xFFEEE133);
        hi = 'You are OVERWEIGHT!';
      } else if (_result >= 30 && _result <= 34.9) {
        mycolor = Color(0xFFFD802E);
        hi = 'You are OBESE!!';
      } else if (_result >= 35) {
        mycolor = Color.fromARGB(255, 245, 4, 4);
        hi = 'EXTREME!!!';
      }
    });
  }
}
