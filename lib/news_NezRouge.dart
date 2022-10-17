
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class InfoNezRouge extends StatefulWidget {
  const InfoNezRouge({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<InfoNezRouge> createState() => _InfoNezRougeState();
}

class _InfoNezRougeState extends State<InfoNezRouge> {
  String _accueil = "La Bande des Nez Rouge";
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
            Color.fromARGB(255, 255, 255, 255),
            Color.fromARGB(255, 211, 211, 211),
          ],
        )),
        child: Column(
        
          children: [
            SizedBox(width: 500, height: 450,child:LogoNezRouge(),),
            
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                _accueil,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Staatliches-Regular'),
              ),
            ),
           
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Organisé par Cyril Franklin"),
                ),
                const Text(""),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text("Venez chanter sur scène avec La Bande des Nez Rouge pour la bonne cause, une date = 1 don pour la ligue contre le cancer du Nord."),
              ),
            
           
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

class LogoNezRouge extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = const AssetImage('assets/images/nezrouge.jpg');
    Image image = Image(image: assetImage,);
    return Container(child: image,);
  }
}