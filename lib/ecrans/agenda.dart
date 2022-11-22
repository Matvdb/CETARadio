import 'package:ceta_radio/info_emissions/adlm.dart';
import 'package:ceta_radio/info_emissions/touzazimut.dart';
import 'package:flutter/material.dart';
import '../info_emissions/cetacovershow.dart';
import '../info_emissions/cetalentdcheznous.dart';
import '../info_emissions/cetatoideparler.dart';
import '../info_emissions/letop.dart';
import '../info_emissions/nas.dart';
import 'news.dart';
import 'info.dart';
import 'nousecouter.dart';
import 'podcasts.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key, required this.title}) : super(key: key);
  @override
  State<Agenda> createState() => _AgendaState();
  final String title;
}

class _AgendaState extends State<Agenda> {
  final String _accueil = "Programmes";
  final String infoEm = "Test";

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
            const SizedBox(
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
      body: Container(
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 199, 198, 198)),
                child: PopupMenuButton<MenuItem>(
                  child: const Text(
                    "Nos emissions",
                    style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 20.0,
                        fontFamily: 'AlfaSlabOne-Regular'),
                  ),
                  onSelected: (value) {
                    if (value == MenuItem.AutourDeLaMusique) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AutourDeLaMusique(
                                title: 'Autour de la Musique',
                              )));
                    } else if (value == MenuItem.CETACoverShow) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CETACoverShow(
                                title: 'CETA Cover Show',
                              )));
                    } else if (value == MenuItem.CETALENTdChezNous) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CETALENTdChezNous(
                                title: 'CETALENT dChezNous',
                              )));
                    } else if (value == MenuItem.CETAToiDeParler) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CETAToiDeParler(
                                title: 'CETATOI de parler',
                              )));
                    } else if (value == MenuItem.LeTop) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LeTop(
                                title: 'Le Top',
                              )));
                    } else if (value == MenuItem.NordAcousticShow) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NordAcousticShow(
                                title: 'Nord Acoustic Show',
                              )));
                    } else if (value == MenuItem.TouZaZimut) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const TouZazimut(
                                title: 'TouZazimut',
                              )));
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: MenuItem.AutourDeLaMusique,
                      child: Text("Autour de la Musique"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.CETACoverShow,
                      child: Text("CETACover Show"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.CETALENTdChezNous,
                      child: Text("CETALENT d'Chez Nous"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.CETAToiDeParler,
                      child: Text("CETA Toi de Parler avec Brigitte"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.LeTop,
                      child: Text("Le Top"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.NordAcousticShow,
                      child: Text("Nord Acoustic Show"),
                    ),
                    const PopupMenuItem(
                      value: MenuItem.TouZaZimut,
                      child: Text("Tou'Z'aZimut"),
                    ),
                  ],
                ),
              ),
            ),
            const Text(""),
            const Text(""),
           
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text("Afin de retrouver l'ensemble de nos programmes / émissions, vous êtes invités à cliquer sur l'onglet ci-dessus car n'oublions pas...", style: TextStyle(fontSize: 20, fontFamily: 'Lato-Regular'),),
              ),
              const Text(""),
              const Align(
              alignment: Alignment.bottomCenter,
              child: Text("CETA Radio... C'est VOTRE web-radio !!!", style: TextStyle(color: Colors.white ,fontSize: 30, fontFamily: 'Staatliches-Regular'),),
             ),
             const Text(""),
            const Align(alignment: Alignment.bottomCenter,child: Equipe(),),
          ],
        ),
      ),

      // BottomBar, permettant l'accès aux diverses fonctionnalitées
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
              const IconButton(
                onPressed: null,
                tooltip: "Agenda",
                iconSize: 27.0,
                icon: Icon(
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

enum MenuItem {
  AutourDeLaMusique,
  CETACoverShow,
  CETALENTdChezNous,
  CETAToiDeParler,
  LeTop,
  NordAcousticShow,
  TouZaZimut,
}

class Logo extends StatelessWidget {
  const Logo({Key? key}) : super(key: key);

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
  const Equipe({Key? key}) : super(key: key);

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

