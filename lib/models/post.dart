import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:little_walk/models/upload.dart';
part 'post.freezed.dart';
part 'post.g.dart';

@freezed
class CreatePost with _$CreatePost {
  const factory CreatePost(
      {@Default("") String text,
      @Default([]) List<UploadedFile> medias}) = _CreatePost;

  factory CreatePost.fromJson(Map<String, dynamic> json) =>
      _$CreatePostFromJson(json);
}

@freezed
class PostMedia with _$PostMedia {
  const factory PostMedia({
    required String id,
    @JsonKey(name: "uploaded_file") required UploadedFile uploadedFile,
  }) = _PostMedia;

  factory PostMedia.fromJson(Map<String, dynamic> json) =>
      _$PostMediaFromJson(json);
}

@freezed
class Profile with _$Profile {
  const factory Profile({
    required String id,
    required String name,
    required UploadedFile avatar,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String id,
    required Profile profile,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

@freezed
class Post with _$Post {
  const factory Post({
    required String id,
    required String text,
    required List<PostMedia> medias,
    required UserInfo poster,
  }) = _Post;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}
