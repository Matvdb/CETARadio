
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class NordAcousticShow extends StatefulWidget {
  const NordAcousticShow({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<NordAcousticShow> createState() => _NordAcousticShowState();
}

class _NordAcousticShowState extends State<NordAcousticShow> {
  String _accueil = "Le Nord Acoustic Show";
  final Uri _url = Uri.parse(
      'http://nouveausite.cetaradio.fr/cetawp/index.php/nordacousticshow/?_ga=2.95735772.1120802952.1656322212-1638797158.1642001625');

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
              child: nas(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Nord Acoustic Show')),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: nas(),
                width: 250,
                height: 250,
              ),
            ),
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
                "Une émission, un groupe, un artiste, du divertissement, de la musique acoustique en direct et de l'Interview !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Emission phare de votre web-radio, l'équipe de CETA Radio se mobilise pour mettre en avant les talents des Hauts de France et Région Parisienne.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Animée par Patrick et Vincent, assistés des autres membres de l'équipe.",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Les Dimanche de 16h30 à 18h",
                style: TextStyle(
                    color: Color.fromARGB(255, 209, 24, 10),
                    decoration: TextDecoration.underline,
                    fontSize: 30.0,
                    fontFamily: 'Staatliches-Regular'),
              ),
            ),
            const Text(""),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                // ignore: deprecated_member_use
                onPressed: () => launch(
                    "http://nouveausite.cetaradio.fr/cetawp/index.php/nordacousticshow/?_ga=2.95735772.1120802952.1656322212-1638797158.1642001625"),
                onLongPress: () {
                  const Text("Plus d'informations sur le Nord Acoustic Show");
                },
                child: const Text("Nord Acoustic Show"),
              ),
            )
          ],
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

class nas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/NAS.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}
