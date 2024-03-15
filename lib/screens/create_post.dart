import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_walk/blocs/post.dart';
import 'package:little_walk/components/buttons/upload_media_button.dart';
import 'package:little_walk/components/images/uploaded_images.dart';
import 'package:little_walk/components/utils.dart';

class CreatePostScreen extends StatelessWidget {
  const CreatePostScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CreatePostCubit(),
        child: Builder(
          builder: (context) {
            final post = BlocProvider.of<CreatePostCubit>(context);
            return Scaffold(
                appBar: AppBar(
                  leading: TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const Text("取消")),
                  actions: [
                    TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.blue[400]),
                        onPressed: () => post.create().then(
                            (_) => Navigator.of(context).pop(),
                            onError: (err) => showErrorMessage(context, err)),
                        child: const Text("发布"))
                  ],
                ),
                body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                          child: TextField(
                        autofocus: true,
                        decoration: const InputDecoration(hintText: "说说你的新鲜事"),
                        onChanged: (value) => post.setText(value),
                      )),
                      BlocProvider(
                          create: (_) {
                            final cubit = MediasCubit(
                                remove: (id) => post.removeMedia(id),
                                medias: post.state.medias);
                            post.onMediasChanged = (ids) => cubit.setIDs(ids);
                            return cubit;
                          },
                          child: const MediaCarousel()),
                      Row(
                        children: [
                          UploadMediaButton(
                              source: ImageSource.camera,
                              addMedias: (medias) => post.addMedias(medias)),
                          UploadMediaButton(
                              source: ImageSource.gallery,
                              addMedias: (medias) => post.addMedias(medias))
                        ],
                      )
                    ]));
          },
        ));
  }
}
