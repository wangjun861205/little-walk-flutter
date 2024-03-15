import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:little_walk/models/upload.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Medias {
  final List<UploadedFile> medias;

  const Medias({required this.medias});
}

class MediasCubit extends Cubit<List<UploadedFile>> {
  void Function(UploadedFile file) remove;

  MediasCubit({required this.remove, required List<UploadedFile> medias})
      : super(medias);

  void setIDs(List<UploadedFile> medias) => emit(medias);
}

class VideoView extends StatelessWidget {
  final String src;

  const VideoView({required this.src, super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = VideoPlayerController.networkUrl(Uri.parse(src),
        httpHeaders: {"Authorization": AuthToken.token!});
    final chewieCtrl = ChewieController(
        videoPlayerController: ctrl,
        autoPlay: false,
        looping: false,
        autoInitialize: true);
    return Chewie(
      controller: chewieCtrl,
    );
  }
}

class MediaCarousel extends StatelessWidget {
  const MediaCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final medias = BlocProvider.of<MediasCubit>(context, listen: true);
    if (medias.state.isEmpty) {
      return Container();
    }
    return CarouselSlider.builder(
      itemCount: medias.state.length,
      options: CarouselOptions(
          height: 200, enlargeCenterPage: true, enableInfiniteScroll: false),
      itemBuilder: (context, i, ri) => Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(50, 20, 100, 200),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            alignment: Alignment.center,
            width: 400,
            child: medias.state[i].mimeType.contains("video")
                ? VideoView(
                    src:
                        "http://${Config.backendAddress}/apis/v1/uploads/${medias.state[i].id}")
                : Image.network(
                    "http://${Config.backendAddress}/apis/v1/uploads/${medias.state[i].id}",
                    fit: BoxFit.fill,
                    headers: {"Authorization": AuthToken.token!},
                  ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: SizedBox(
                  width: 30,
                  height: 30,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: Icon(Icons.close, color: Colors.grey[500]),
                    style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black),
                    onPressed: () => medias.remove(medias.state[i]),
                  )))
        ],
      ),
    );
  }
}
