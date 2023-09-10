import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  String videoId = "";

  FullScreenVideoPlayer({Key? key, required this.videoId}) : super(key: key);

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        hideControls: false,
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    // Reset the device orientation when the screen is disposed
    _controller.dispose();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YoutubePlayer(
        controller: _controller,
        // aspectRatio: _isFullScreen ? _aspectRatio : 16 / 9,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.red,
        progressColors: ProgressBarColors(
          playedColor: Colors.red,
          handleColor: Colors.redAccent,
        ),
        onReady: () {
          // Perform any actions when the player is ready.
        },
        onEnded: (_) {
          // Perform any actions when the video ends.
        },
      ),
      // body: Center(
      //   child: FullScreenPlayer(
      //     controller: _controller,
      //     showThumbnail: true,
      //   ),
      // ),
    );
  }
}












class FullScreenPlayer extends StatefulWidget {
  final YoutubePlayerController controller;
  final bool showThumbnail;

  FullScreenPlayer({
    required this.controller,
    this.showThumbnail = false,
  });

  @override
  _FullScreenPlayerState createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late YoutubePlayerController _controller;
  late double _aspectRatio;
  late bool _isFullScreen;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller;
    // _aspectRatio = _controller.value.aspectRatio;
    _isFullScreen = false;

    // _controller.toggleFullScreenMode();
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    _controller.dispose();
    super.dispose();
  }

  void _toggleFullScreen() {
    setState(() {
      _isFullScreen = !_isFullScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleFullScreen,
      child: Stack(
        children: [
          Positioned.fill(
            child: YoutubePlayer(
              controller: _controller,
              aspectRatio: _isFullScreen ? _aspectRatio : 16 / 9,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.red,
              progressColors: ProgressBarColors(
                playedColor: Colors.red,
                handleColor: Colors.redAccent,
              ),
              onReady: () {
                // Perform any actions when the player is ready.
              },
              onEnded: (_) {
                // Perform any actions when the video ends.
              },
            ),
          ),
          // if (_isFullScreen && widget.showThumbnail)
          //   Positioned.fill(
          //     child: Container(
          //       color: Colors.black,
          //       child: Center(
          //         child: Icon(
          //           Icons.play_arrow,
          //           color: Colors.white,
          //           size: 80,
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
