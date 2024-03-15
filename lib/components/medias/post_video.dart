import 'package:flutter/material.dart';
import 'package:little_walk/main.dart';
import 'package:video_player/video_player.dart';

class PostVideo extends StatelessWidget {
  final String videoURL;
  final String thumbnailURL;
  final double width;
  final double height;
  late VideoPlayerController ctrl;
  late Future<void> future;

  PostVideo(
      {required this.videoURL,
      required this.thumbnailURL,
      required this.width,
      required this.height,
      super.key}) {
    ctrl = VideoPlayerController.networkUrl(Uri.parse(videoURL),
        httpHeaders: {"Authorization": "Bearer ${AuthToken.token}"});
    future = ctrl.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("加载视频失败");
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return SizedBox(
                width: width,
                height: height,
                child: const Center(child: CircularProgressIndicator()));
          }
          return Stack(
            children: [
              Positioned(
                  child: SizedBox(
                      width: width,
                      height: height,
                      child: Image.network(thumbnailURL, headers: {
                        "Authorization": "Bearer ${AuthToken.token}"
                      }))),
              Positioned(
                  child: SizedBox(
                      width: width, height: height, child: VideoPlayer(ctrl)))
            ],
          );
        });
  }
}
