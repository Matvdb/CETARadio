
import 'package:ceta_radio/info_emissions/letop.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Podcastsletop extends StatefulWidget {
  const Podcastsletop({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<Podcastsletop> createState() => _PodcastsletopState();
}

class _PodcastsletopState extends State<Podcastsletop> {
  final String _accueil = "Le Top";
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
            const SizedBox(
              width: 300, 
              height: 300,
              child:Image(
                image: AssetImage("assets/images/LeTop.png")
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                _accueil,
                textDirection: TextDirection.ltr,
                style: const TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 20.0,
                    fontFamily: 'Staatliches-Regular',
                  ),
              ),
            ),
            Row(
              children: const [
                Align(),
                Align(),
           ],
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

class LogoHarnesFete extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    AssetImage assetImage = const AssetImage('assets/images/Harnes.jpg');
    Image image = Image(image: assetImage,);
    return Container(child: image,);
  }
}