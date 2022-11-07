

import 'package:ceta_radio/agenda.dart';
import 'package:ceta_radio/info.dart';
import 'package:ceta_radio/news.dart';
import 'package:ceta_radio/podcasts.dart';
import 'package:ceta_radio/url.dart';
import 'package:ceta_radio/youtube_player_screen.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'url.dart';

import 'nousecouter.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _accueil = "CETA Radio... C'est votre web radio !!!";
  final Uri _url = Uri.parse('http://www.cetaradio.fr/player/');

  void _launchUrl() async {
    if (!await launchUrl(_url)) throw 'Could not launch $_url';
  }

  void PageURL() {
    setState(() {
      const URLSite();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Texte principal
      appBar: AppBar(
        centerTitle: true,
            title: const Text("CETA Radio", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
            body: Container(
                    height: MediaQuery.of(context).size.height * 0.834,
                    width: MediaQuery.of(context).size.width * 1,
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
                      mainAxisAlignment: MainAxisAlignment.center,
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
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CustomYoutubePLayer(
                                    "https://www.youtube.com/watch?v=oRLklKUd0hg&ab_channel=CETARadio"
                                  ),
                                ),
                              );
                            },
                            onLongPress: () {
                              const Text("Chaîne YouTube de CETA Radio");
                            },
                            child: const Text("YouTube"),
                          ),
                        ),
                        ],
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
                              return FadeTransition(
                                  
                                  opacity: animation,
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return FadeTransition(
                                  
                                  opacity: animation,
                                  child: child);
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return FadeTransition(
                                  
                                  opacity: animation,
                                  child: child);
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
                              return FadeTransition(
                                  
                                  opacity: animation,
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
                            transitionsBuilder: (context, animation,
                                secondaryAnimation, child) {
                              var begin = const Offset(0.0, 1.0);
                              var end = Offset.zero;
                              var curve = Curves.ease;
                              var tween = Tween(begin: begin, end: end)
                                  .chain(CurveTween(curve: curve));
                              return FadeTransition(
                                  
                                  opacity: animation,
                                  child: child);
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
