import 'package:carousel_slider/carousel_slider.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:little_walk/main.dart';
import 'package:little_walk/models/post.dart';
import 'package:video_player/video_player.dart';

class PostTile extends StatelessWidget {
  final Post post;

  const PostTile({required this.post, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
            flex: 2,
            child: CircleAvatar(
              backgroundImage: Image.network(
                  "http://${Config.backendAddress}/apis/v1/uploads/${post.poster.profile.avatar.id}",
                  headers: {"Authorization": AuthToken.token!}).image,
            )),
        Flexible(
            flex: 8,
            child: Column(children: [
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    post.poster.profile.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              Text(post.text),
              post.medias.isNotEmpty
                  ? CarouselSlider.builder(
                      itemCount: post.medias.length,
                      itemBuilder: (context, i, ri) {
                        if (post.medias[i].uploadedFile.mimeType
                            .contains("video")) {
                          final ctrl = VideoPlayerController.networkUrl(
                              Uri.parse(
                                  "http://${Config.backendAddress}/apis/v1/uploads/${post.medias[i].uploadedFile.id}"),
                              httpHeaders: {"Authorization": AuthToken.token!});
                          final chewieCtrl = ChewieController(
                              videoPlayerController: ctrl,
                              autoInitialize: true,
                              autoPlay: false,
                              looping: false);
                          return Container(
                            width: 400,
                            decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Chewie(controller: chewieCtrl),
                          );
                        }
                        return Container(
                            width: 400,
                            decoration: const BoxDecoration(
                                color: Colors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Image.network(
                                "http://${Config.backendAddress}/apis/v1/uploads/${post.medias[i].uploadedFile.id}",
                                headers: {"Authorization": AuthToken.token!}));
                      },
                      options: CarouselOptions(
                          enlargeCenterPage: true, enableInfiniteScroll: false))
                  : Container(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.chat)),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.link),
                  ),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.thumb_up)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.numbers))
                ],
              )
            ]))
      ],
    );
  }
}
