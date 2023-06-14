// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, no_leading_underscores_for_local_identifiers

import 'dart:async';

import 'package:flutter/material.dart';

import '../db/functions/functions.dart';
import 'mainscreen.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getallrem();
    getallprof();
    super.initState();
    Timer(const Duration(seconds: 1), () async {
      await Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) {
        return Mainscreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splashimage.png',
                width: 140, height: 140),
          ],
        ),
      ),
    );
  }
}
