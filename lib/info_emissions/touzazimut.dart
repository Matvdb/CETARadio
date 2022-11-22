
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class TouZazimut extends StatefulWidget {
  const TouZazimut({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<TouZazimut> createState() => _TouZazimutState();
}

class _TouZazimutState extends State<TouZazimut> {
  String _accueil = "Tou'Z'azimut";
  final Uri _url = Uri.parse(
      'http://nouveausite.cetaradio.fr/cetawp/index.php/touzazimut-4/');

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
              child: touzazimut(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text("Tou'Z'azimut")),
          ],
        ),
      ),

      // Texte principal
      body: SingleChildScrollView(scrollDirection: Axis.vertical, child: Container(
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
                child: touzazimut(),
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
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "L'émission de chroniques diverses et variées autour de différents sujet (actus, musique, jeux vidéos, etc...), d'infos, débats et de partages !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Réagissez en Direct sur notre page Facebook ou contactez nous par téléphone au 09.81.74.24.36 pendant l'émission.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Animée par Patrick ainsi que les différents chroniqueurs / animateurs, réalisée par l'équipe de CETA Radio.",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Un Vendredi/Mois de 19h à 20h30",
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
                onPressed: () => launch(""),
                onLongPress: () {
                  const Text("Apprenez en plus sur Tou'Z'azimut");
                },
                child: const Text("Tou'Z'azimut"),
              ),
            )
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

class touzazimut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/touzazimut.jpg');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}
