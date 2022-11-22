
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class CETACoverShow extends StatefulWidget {
  const CETACoverShow({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CETACoverShow> createState() => _CETACoverShowState();
}

class _CETACoverShowState extends State<CETACoverShow> {
  final String _accueil = "CETA Cover Show... C'est quoi ?";
  final Uri _url = Uri.parse('http://www.cetaradio.fr/player/');


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
              child: CoverShowLogo(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('CETA Cover SHow')),
          ],
        ),
      ),

      // Texte principal
      body:SingleChildScrollView(scrollDirection: Axis.vertical, child:Container(
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
                child: SizedBox(
                  height: 250,
                  width: 250,
                  child: CoverShowLogo(),
                )),
            const Text(""),
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
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Emission des Interprètes amateurs ou pro en direct Live et interview avec l'équipe de CETA RADIO",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "1 à 2 titres personnels et des reprises permettant à  des artistes de pouvoir s'exprimer en chanson et de découvrir l'univers musical.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Emission annimé par Vincent et Patrick, assistés des autres membres de l'équipe.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Les Dimanche de 16h30 à 18h",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 209, 24, 10),
                    fontSize: 30.0,
                    fontFamily: 'Staatliches-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Pour plus d'infos et d'écoute d'émissions, veuillez-vous rendre sur la page du site !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Text(""),
            Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: const Text(
                    'CETA Cover Show',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  onPressed: () => launch(
                      'http://nouveausite.cetaradio.fr/cetawp/index.php/cetacovershow/'),
                )),
          ],
        ),
      ),
      ),
    );
  }
}

// Classe de l'image 'logo', moyen plus rapide d'utilisation
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

// Classe de l'image 'Equipe', moyen plus rapide d'utilisation
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

class CoverShowLogo extends StatelessWidget {
  const CoverShowLogo({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/coverShow.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}
