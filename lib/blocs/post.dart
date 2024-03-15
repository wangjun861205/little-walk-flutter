import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/client.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/models/post.dart';
import 'package:little_walk/models/upload.dart';

class CreatePostCubit extends Cubit<CreatePost> {
  void Function(List<UploadedFile> medias)? onMediasChanged;

  CreatePostCubit() : super(const CreatePost());

  void setOnMediasChanged(Function(List<String>) onMediasChanged) =>
      onMediasChanged = onMediasChanged;

  void setText(String text) => emit(state.copyWith(text: text));

  void setMedias(List<UploadedFile> medias) {
    emit(state.copyWith(medias: medias));
    onMediasChanged?.call(state.medias);
  }

  void addMedias(List<UploadedFile> medias) {
    emit(state.copyWith(medias: [...state.medias, ...medias]));
    onMediasChanged?.call(state.medias);
  }

  void removeMedia(UploadedFile media) {
    emit(state.copyWith(
        medias: state.medias.where((element) => element != media).toList()));
    onMediasChanged?.call(state.medias);
  }

  Future<String> create() async {
    final client = HttpClient.fromEnv();
    return await client.createPost(state);
  }
}

class PostsCubit extends QueryCubit<Pagination, List<Post>> {
  PostsCubit()
      : super(Query(
            query: (page) async {
              return await HttpClient.fromEnv().posts(page);
            },
            params: const Pagination(limit: 20, after: null),
            result: [],
            nextParams: (currParams, resp) {
              if (resp.isEmpty) {
                return currParams;
              }
              return Pagination(limit: currParams.limit, after: resp.last.id);
            },
            nextResult: (currResult, resp) {
              currResult.addAll(resp);
              return currResult;
            }));
}
