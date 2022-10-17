
import 'package:ceta_radio/homeScreen.dart';
import 'package:ceta_radio/splashScreen.dart';

import 'package:flutter/material.dart';


//Démarrage de l'application
void main() {
  runApp(const MyApp());
}

// redirection vers la page d'accueil de l'application
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CETA Radio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(
      ),
    );
  }
}
