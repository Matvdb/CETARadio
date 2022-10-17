

import 'package:ceta_radio/agenda.dart';
import 'package:ceta_radio/info.dart';

import 'package:ceta_radio/news_ConcoursDeChant.dart';
import 'package:ceta_radio/news_HarnesEnFetes.dart';
import 'package:ceta_radio/news_NezRouge.dart';
import 'package:ceta_radio/news_SalonLBE.dart';
import 'package:ceta_radio/podcasts.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'nousecouter.dart';


class News extends StatefulWidget {
  const News({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  String _accueil = "Les nouveautées";
  final Uri _url = Uri.parse('http://www.cetaradio.fr/player/');

  void _NousEcouterCETA() {}

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Création de la AppBar
      appBar: AppBar(
        title: Row(
          // Alignement du texte en centre de la AppBar
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Insertion de l'image par la classe Logo
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: Logo(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('CETA Radio')),
          ],
        ),
      ),

      // Texte principal
      body: SingleChildScrollView(
        
      child:Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
              Color.fromARGB(255, 25, 86, 255),
            Color.fromARGB(255, 74, 219, 255),
          ],
        )),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                _accueil,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Staatliches-Regular'),
              ),
            ),
            const Text(""),
            const NewsItem(),
            const Text(""),
            const NezRouge(),
            const Text(""),
            const ConcoursDeChant(),
            const Text(""),
            const SalonLivreBienEtre(),
            const Text(""),
            const NezRouge2(),
          ],
        ),
      ),
      ),

      // BottomBar, permettant l'accès aux diverses fonctionnalitées
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        // Couleur Appbar
        color: Colors.white,
        child: Container(
          margin: const EdgeInsets.only(left: 12.0, right: 12.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const NousEcouter(title: 'CETA Radio'),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child);
                            }));
                  }),
                  tooltip: "Nous écouter",
                  iconSize: 27.0,
                  icon: const Icon(
                    Icons.play_circle_fill_rounded,
                  )),
              // Affiche la focntion lors du clique
              IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Agenda(title: 'CETA Radio'),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = const Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            return SlideTransition(
                                position: animation.drive(tween), child: child);
                          }));
                }),
                tooltip: "Agenda",
                iconSize: 27.0,
                icon: const Icon(
                  Icons.calendar_month_sharp,
                ),
              ),
              IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const Info(title: 'CETA Radio'),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            var begin = const Offset(0.0, 1.0);
                            var end = Offset.zero;
                            var curve = Curves.ease;
                            var tween = Tween(begin: begin, end: end)
                                .chain(CurveTween(curve: curve));
                            return SlideTransition(
                                position: animation.drive(tween), child: child);
                          }));
                }),
                tooltip: "CETA Radio",
                iconSize: 27.0,
                icon: const Icon(
                  Icons.info_outline_rounded,
                ),
              ),
              IconButton(
                  onPressed: (() {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const Podcast(title: 'CETA Radio'),
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child);
                            }));
                  }),
                  tooltip: "Podcasts",
                  iconSize: 27.0,
                  icon: const Icon(Icons.search_rounded)),
              const IconButton(
                onPressed: null,
                tooltip: "Nouveautées",
                iconSize: 27.0,
                icon: Icon(Icons.newspaper_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Classe de l'image 'logo', moyen plus rapide d'utilisation
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/logo200.jpg');
    Image image = Image(
      image: assetImage,
    );
    return Container(child: image);
  }
}

// Classe de l'image 'Equipe', moyen plus rapide d'utilisation
class Equipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/studio equipe.jpg');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}

class NewsItem extends StatelessWidget {
  const NewsItem({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/Harnes.jpg");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoHarnesFete(title: "Harnes en Fêtes")));
      },
    child: Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: image,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("Harnes en Fêtes",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class NezRouge extends StatelessWidget {
  const NezRouge({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/nezrouge.jpg");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoNezRouge(title: "La Bande des Nez Rouge")));
      },
    child :Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: image,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("La Bande des Nez Rouge",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class ConcoursDeChant extends StatelessWidget {
  const ConcoursDeChant({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/concourschant.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoChants(title: "Concours de Chant")));
      },
    child:Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: image,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("Concours de Chant #02",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class SalonLivreBienEtre extends StatelessWidget {
  const SalonLivreBienEtre({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/SalonLBE.jpg");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoSalonLBE(title: "Salon du livre et du bien être")));
      },
    child :Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: image,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("Salon du livre et du bien être",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class NezRouge2 extends StatelessWidget {
  const NezRouge2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/nezrouge.jpg");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>InfoNezRouge(title: "La Bande des Nez Rouge")));
      },
    child:Card(
        margin: EdgeInsets.all(8),
        elevation: 8,
        child: Row(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              widthFactor: null,
              heightFactor: null,
              
              child: Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: image,
                ),
              ),
            ),
            const Align(
              alignment: Alignment.bottomLeft,
              child: Text("La Bande des Nez Rouge",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}