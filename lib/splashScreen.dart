import 'dart:async';

import 'package:ceta_radio/homeScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(title: "CETA Radio"))));
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 25, 86, 255),
            Color.fromARGB(255, 74, 219, 255),
          ],
        )),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 150, width: 150, child: Logo(),),
          Padding(padding: EdgeInsets.all(8)),
          const SpinKitRing(color: Colors.white)
        ],),
      ),
    );
  }
}