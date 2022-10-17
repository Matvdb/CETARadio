
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class URLSite extends StatefulWidget {
  const URLSite({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
          // Création des divers URL sous forme de boutons
          Align(
              alignment: Alignment.bottomLeft,
              child: InkWell(
                child: const Text('Site Officiel'),
                // ignore: deprecated_member_use
                onTap: () => launch('http://www.cetaradio.fr/'),
              )),
          Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: const Text('A propos de CETA Radio'),
                // ignore: deprecated_member_use
                onTap: () => launch(
                    'http://nouveausite.cetaradio.fr/cetawp/index.php/a-propos-de/?_ga=2.87902170.338080940.1655808347-1638797158.1642001625'),
              ))
        ])));
  }

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}
