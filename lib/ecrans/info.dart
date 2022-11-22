
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'news.dart';

import 'nousecouter.dart';
import 'podcasts.dart';
import 'agenda.dart';

class Info extends StatefulWidget {
  const Info({Key? key, required this.title}) : super(key: key);
  @override
  State<Info> createState() => _InfoState();
  final String title;
}

class _InfoState extends State<Info> {
  final String _accueil = "Renseigne toi sur ta Web-Radio";

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
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
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
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "CETA Radio est une web-radio Pop, Rock se situant entre 'RTL2' et 'Virgin Radio' dans sa programmation.",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'BreeSerif-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Au programme, de la musique Pop, Rocket et Electro 24h/24, 7j/7. Des émissions diverses et variées, d'information et de découverte musicale, le tout EN DIRECT",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'BreeSerif-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Web-radio gérée par des bénévoles ayant tous différentes passions, dans des domaines diverses et variés, oeuvrant pour vous offrir le MEILLEUR !",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'BreeSerif-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Pour plus d'information, veuillez vous rendre sur notre site Internet",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'BreeSerif-Regular'),
              ),
            ),
            const Text(""),
            const Text(""),
            Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: const Text(
                    'Site Officiel',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  onPressed: () => launch('http://www.cetaradio.fr/'),
                )),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 250,
                width: 500,
                child: Equipe(),
              ),
            ),
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
              const IconButton(
                onPressed: null,
                tooltip: "CETA Radio",
                iconSize: 27.0,
                icon: Icon(
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
