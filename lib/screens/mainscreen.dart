// ignore_for_file: prefer_const_constructors, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:medi/screens/home/bmi.dart';
import 'package:medi/screens/home/home.dart';
import 'package:medi/screens/home/profile.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int _currentselectindex = 0;
  final _pagecontroller = PageController();
  final _pages = [Homescreen(), Bmi(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _currentselectindex = value;
          });
        },
        controller: _pagecontroller,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.green,
          unselectedFontSize: 15,
          unselectedItemColor: Color.fromARGB(255, 127, 211, 235),
          currentIndex: _currentselectindex,
          onTap: (value) {
            setState(() {
              _currentselectindex = value;
              _pagecontroller.animateToPage(_currentselectindex,
                  duration: Duration(milliseconds:200), curve: Curves.linear);
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.health_and_safety), label: 'BMI'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PROFILE')
          ]),
    );
  }
}
