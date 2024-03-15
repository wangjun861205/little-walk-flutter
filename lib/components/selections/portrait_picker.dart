import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/blocs/dog.dart';

class DogPortraitPicker extends StatelessWidget {
  final Widget child;

  const DogPortraitPicker(this.child, {super.key});

  Future<Uint8List?> crop(String path) async {
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: path,
      cropStyle: CropStyle.circle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.blueGrey,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        ),
      ],
    );
    if (croppedImage == null) {
      return null;
    }
    return croppedImage.readAsBytes();
  }

  Future<String?> upload({required ImageSource imageSource}) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) {
      return null;
    }
    final bs = await crop(image.path);
    if (bs == null) {
      return null;
    }
    final res = await httpUploadFile(
      path: "/apis/uploads",
      files: [MultipartFile.fromBytes("file", bs, filename: image.name)],
    );
    return res["ids"][0];
  }

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogCubit>(context);
    return InkWell(
        onTap: () async {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 115,
                    child: Column(children: [
                      TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            final id =
                                await upload(imageSource: ImageSource.gallery);
                            if (id == null) {
                              return;
                            }
                            dogBloc.setPortrait(id);
                          },
                          child: const Text("从相册选择")),
                      const Divider(),
                      TextButton(
                          onPressed: () async {
                            Navigator.of(context).pop();
                            final id =
                                await upload(imageSource: ImageSource.camera);
                            if (id == null) {
                              return;
                            }
                            dogBloc.setPortrait(id);
                          },
                          child: const Text("拍摄"))
                    ]));
              });
        },
        child: child);
  }
}
