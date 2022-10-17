
import 'package:ceta_radio/podcasts_NAS.dart';
import 'package:ceta_radio/podcasts_adlm.dart';
import 'package:ceta_radio/podcasts_cetacovershow.dart';
import 'package:ceta_radio/podcasts_cetatoideparler.dart';
import 'package:ceta_radio/podcasts_letop.dart';
import 'package:ceta_radio/podcasts_touzazimut.dart';
import 'package:ceta_radio/podcats_cetalent.dart';
import 'package:flutter/material.dart';

import 'news.dart';
import 'info.dart';
import 'nousecouter.dart';

import 'agenda.dart';

class Podcast extends StatefulWidget {
  const Podcast({Key? key, required this.title}) : super(key: key);
  @override
  State<Podcast> createState() => _PodcastState();
  final String title;
}

class _PodcastState extends State<Podcast> {
  String _accueil = "Podcasts";

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
            const AdLm(),
            const Text(""),
            const CETAlent(),
            const Text(""),
            const CETAcs(),
            const Text(""),
            const CETAtoi(),
            const Text(""),
            const Ltop(),
            const Text(""),
            const Nordas(),
            const Text(""),
            const Touzazimuut(),
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
              const IconButton(
                  onPressed: null,
                  tooltip: "Podcasts",
                  iconSize: 27.0,
                  icon: Icon(Icons.search_rounded)),
              IconButton(
                onPressed: (() {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const News(title: 'CETA Radio'),
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
                tooltip: "Nouveautées",
                iconSize: 27.0,
                icon: const Icon(Icons.newspaper_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

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
  class AdLm extends StatelessWidget {
  const AdLm({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/ADLM.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PodcastsADLM(title: "Autour de la Musique")));
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
              child: Text("Autour De La Musique",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class CETAlent extends StatelessWidget {
  const CETAlent({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/CETALENTdChezNous.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PodcastsCETAlent(title: "CETATALENT dChez Nous")));
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
              child: Text("CETALENT d'Chez Nous",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class CETAcs extends StatelessWidget {
  const CETAcs({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/coverShow.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PodcastsCETACoverShow(title: "CETA Cover Show")));
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
              child: Text("CETA Cover Show",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class CETAtoi extends StatelessWidget {
  const CETAtoi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/CETAToiDeParler.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PodcastsCETAToideParler(title: "CETATOI de Parler")));
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
              child: Text("CETA Toi De Parler",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

class Ltop extends StatelessWidget {
  const Ltop({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/LeTop.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Podcastsletop(title: "Le Top")));
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
              child: Text("Le Top",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}
class Nordas extends StatelessWidget {
  const Nordas({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/NAS.png");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>PodcastsNAS(title: "Nord Acoustic Show")));
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
              child: Text("Nord Acoustic Show",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}
class Touzazimuut extends StatelessWidget {
  const Touzazimuut({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage("assets/images/touzazimut.jpg");
    Image image = Image(image: assetImage);
    SizedBox(
      width: 100,
      height: 100,
      child: image,
    );
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Podcaststouz(title: "Touzazimut")));
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
              child: Text("touzazimut",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ],
        )));
  }
}

