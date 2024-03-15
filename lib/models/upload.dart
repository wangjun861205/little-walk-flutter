import 'package:freezed_annotation/freezed_annotation.dart';
part 'upload.freezed.dart';
part 'upload.g.dart';

@freezed
class UploadedFile with _$UploadedFile {
  const factory UploadedFile({
    required String id,
    @JsonKey(name: "mime_type") required String mimeType,
  }) = _UploadedFile;

  factory UploadedFile.fromJson(Map<String, dynamic> json) =>
      _$UploadedFileFromJson(json);
}
