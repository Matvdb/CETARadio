
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class LeTop extends StatefulWidget {
  const LeTop({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<LeTop> createState() => _LeTopState();
}

class _LeTopState extends State<LeTop> {
  String _accueil = "Le Top";
  final Uri _url =
      Uri.parse('http://nouveausite.cetaradio.fr/cetawp/index.php/le-top/');

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
              child: letop(),
            ),
            // Insertion du titre de l'application
            Container(
                padding: const EdgeInsets.all(8.0), child: const Text('LeTop')),
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
                child: letop(),
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
                "Emission de votent, de découverte musciales et de partage grâce à vos avis !",
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
                "Votez Pour ou Contre sur le player de notre site afin de générer Le Top !",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontFamily: 'Lato-Regular'),
              ),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Le Top, c'est le classement des 15 meilleurs titres choisit et voté par les auditeurs de votre web-radio",
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
                "Tu souhaites participer ? C'est soit via le lien ci-dessous, soit directement via notre site !",
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
                "Les Dimanche de 20h à 21h",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(255, 209, 24, 10),
                    fontSize: 30.0,
                    fontFamily: 'Staatliches-Regular'),
              ),
            ),
            const Text(""),
            const Text(""),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () =>
                    // ignore: deprecated_member_use
                    launch(
                        "http://nouveausite.cetaradio.fr/cetawp/index.php/le-top/"),
                onLongPress: () {
                  const Text("Découvrez-en plus sur Le Top");
                },
                child: const Text("Le Top"),
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

class letop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = const AssetImage('assets/images/LeTop.png');
    Image image = Image(
      image: assetImage,
    );
    return Container(
      child: image,
    );
  }
}
