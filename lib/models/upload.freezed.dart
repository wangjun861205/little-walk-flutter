// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) {
  return _UploadedFile.fromJson(json);
}

/// @nodoc
mixin _$UploadedFile {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: "mime_type")
  String get mimeType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadedFileCopyWith<UploadedFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedFileCopyWith<$Res> {
  factory $UploadedFileCopyWith(
          UploadedFile value, $Res Function(UploadedFile) then) =
      _$UploadedFileCopyWithImpl<$Res, UploadedFile>;
  @useResult
  $Res call({String id, @JsonKey(name: "mime_type") String mimeType});
}

/// @nodoc
class _$UploadedFileCopyWithImpl<$Res, $Val extends UploadedFile>
    implements $UploadedFileCopyWith<$Res> {
  _$UploadedFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedFileImplCopyWith<$Res>
    implements $UploadedFileCopyWith<$Res> {
  factory _$$UploadedFileImplCopyWith(
          _$UploadedFileImpl value, $Res Function(_$UploadedFileImpl) then) =
      __$$UploadedFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, @JsonKey(name: "mime_type") String mimeType});
}

/// @nodoc
class __$$UploadedFileImplCopyWithImpl<$Res>
    extends _$UploadedFileCopyWithImpl<$Res, _$UploadedFileImpl>
    implements _$$UploadedFileImplCopyWith<$Res> {
  __$$UploadedFileImplCopyWithImpl(
      _$UploadedFileImpl _value, $Res Function(_$UploadedFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? mimeType = null,
  }) {
    return _then(_$UploadedFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadedFileImpl implements _UploadedFile {
  const _$UploadedFileImpl(
      {required this.id, @JsonKey(name: "mime_type") required this.mimeType});

  factory _$UploadedFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadedFileImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: "mime_type")
  final String mimeType;

  @override
  String toString() {
    return 'UploadedFile(id: $id, mimeType: $mimeType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, mimeType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedFileImplCopyWith<_$UploadedFileImpl> get copyWith =>
      __$$UploadedFileImplCopyWithImpl<_$UploadedFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadedFileImplToJson(
      this,
    );
  }
}

abstract class _UploadedFile implements UploadedFile {
  const factory _UploadedFile(
          {required final String id,
          @JsonKey(name: "mime_type") required final String mimeType}) =
      _$UploadedFileImpl;

  factory _UploadedFile.fromJson(Map<String, dynamic> json) =
      _$UploadedFileImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: "mime_type")
  String get mimeType;
  @override
  @JsonKey(ignore: true)
  _$$UploadedFileImplCopyWith<_$UploadedFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
