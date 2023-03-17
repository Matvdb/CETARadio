

import 'package:flutter/material.dart';



import 'news.dart';
import 'info.dart';

import 'podcasts.dart';
import 'agenda.dart';
import 'package:audioplayers/audioplayers.dart';

class NousEcouter extends StatefulWidget {
  const NousEcouter({Key? key, required this.title}) : super(key: key);
  @override
  State<NousEcouter> createState() => _NousEcouterState();
  final String title;
}

class _NousEcouterState extends State<NousEcouter> {
  final String _accueil = "Ecoutez votre Web-Radio";
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical, 
        child: Container(
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
            Container(
              
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                        width: double.infinity, height: 350, child: Logo())),
              ),
            ),
            Container(
              
              child: const Align(alignment: Alignment.bottomCenter,
              child:  SizedBox(
              height: 32,
            ),),
            ),
            Container(
            child: const Align(alignment: Alignment.bottomCenter,
            child: Text(
              "CETA Radio",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),),),
           
          
            Slider(
              min: 0,
              max: duration.inSeconds.toDouble(),
              value: position.inSeconds.toDouble(),
              onChanged: (value) async {
                final position = Duration(seconds: value.toInt());
                await audioPlayer.seek(position);

                await audioPlayer.resume();
              },
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration - position)),
                  ],
                )),
            CircleAvatar(
              radius: 35,
              child: IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                ),
                iconSize: 50,
                onPressed: () async {
                  if (isPlaying) {
                     await audioPlayer.pause();
                
                  } else {
                    String url = "www.cetaradio.fr/player";
                     await audioPlayer.play(url);
                  }
                },
              ),
            ),
          ],
        ),
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
              const IconButton(
                  onPressed: null,
                  tooltip: "Nous écouter",
                  iconSize: 27.0,
                  icon: Icon(
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
