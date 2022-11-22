
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class AutourDeLaMusique extends StatefulWidget {
  const AutourDeLaMusique({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<AutourDeLaMusique> createState() => _AutourDeLaMusiqueState();
}

class _AutourDeLaMusiqueState extends State<AutourDeLaMusique> {
  final String _accueil = "Autour de la Musique...";
  final Uri _url = Uri.parse(
      'http://nouveausite.cetaradio.fr/cetawp/index.php/autour-de-la-musique-3-2/?_ga=2.92733533.1120802952.1656322212-1638797158.1642001625');


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
            const SizedBox(
              width: 50.0,
              height: 50.0,
              child:  ADLM(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('AutourDeLaMusique')),
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
          children: [
            const Align(
                alignment: Alignment.bottomCenter,
                child:  SizedBox(
                  height: 250,
                  width: 250,
                  child:  ADLM(),
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
                "Grande émission de 1h30 de découverte musicale, d'interview, proposition d'albums etc...",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "C'est l'émission INCONTOURNABLE de la musique et pour les amateurs de musique.",
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
                "La Chronique Flash...",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.white,
                    fontSize: 30.0,
                    fontFamily: 'Staatliches-Regular'),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "pour décourvrir en un instant des artistes et des groupes avec la diffusion de deux singles y compris la présentation.",
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
                "Pour plus d'infos et d'écoute d'émissions, veuillez-vous rendre sur le site officiel !",
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
                    'Autour de la Musique',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  // ignore: deprecated_member_use
                  onPressed: () => launch(
                      'http://nouveausite.cetaradio.fr/cetawp/index.php/autour-de-la-musique-3-2/?_ga=2.92733533.1120802952.1656322212-1638797158.1642001625'),
                )),
          ],
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

class ADLM extends StatelessWidget {
  const ADLM({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/ADLM.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}
