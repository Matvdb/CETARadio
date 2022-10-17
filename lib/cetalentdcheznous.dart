
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class CETALENTdChezNous extends StatefulWidget {
  const CETALENTdChezNous({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<CETALENTdChezNous> createState() => _CETALENTdChezNousState();
}

class _CETALENTdChezNousState extends State<CETALENTdChezNous> {
  final String _accueil = "CETALENT d'Chez Nous";
  final Uri _url = Uri.parse(
      'http://nouveausite.cetaradio.fr/cetawp/index.php/cetalentdecheznous/');


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
              child: cetalent(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0),
                child: const Text("CETALENT d'Chez Nous")),
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
                  width: 250,
                  height: 250,
                  child: cetalent(),
                )),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(_accueil,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30.0,
                      fontFamily: 'Staatliches-Regular')),
            ),
            const Text(""),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Emission d'Interview et de découvertes d'artistes du Nord-Pas-de-Calais !",
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
                "Animée par Brigitte accompagnée d'un membre de l'équipe pour la régie.",
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
                "Les Vendredi de 17h à 18h",
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
                "Pour plus d'informations et d'écoutent, vous êtes invité à rejoindre la page du  site !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Text(""),
            const Text(""),
            Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: const Text(
                    "CETALENT d'Chez Nous",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  // ignore: deprecated_member_use
                  onPressed: () => launch(
                      "http://nouveausite.cetaradio.fr/cetawp/index.php/cetalentdecheznous/)"),
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

class cetalent extends StatelessWidget {
  const cetalent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AssetImage assetImage =
        const AssetImage('assets/images/CETALENTdChezNous.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}
