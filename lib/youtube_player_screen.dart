

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class CustomYoutubePLayer extends StatefulWidget {
  final String? youtubeURL;
  const CustomYoutubePLayer(this.youtubeURL);

  @override
  State<CustomYoutubePLayer> createState() => _CustomYoutubePLayerState();
}

class _CustomYoutubePLayerState extends State<CustomYoutubePLayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
        initialVideoId:
            YoutubePlayerController.convertUrlToId(widget.youtubeURL!)!,
        params: const YoutubePlayerParams(
          loop: false,
          autoPlay: true,
          color: 'transparent',
          strictRelatedVideos: true,
          showFullscreenButton: !kIsWeb,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: kIsWeb ? screenSize.height / 1.33 : screenSize.height,
      width: screenSize.width,
      child: YoutubePlayerControllerProvider(
        controller: _controller,
        child: YoutubePlayerIFrame(controller: _controller),
      ),
    );
  }
}
