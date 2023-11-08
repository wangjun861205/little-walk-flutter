import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../apis/upload.dart' as upload_api;

class PortraitPicker extends StatelessWidget {
  final String backendAddress;
  final String authToken;
  final String? imageID;
  final void Function(String) setImageID;
  final Widget child;

  const PortraitPicker(this.backendAddress, this.authToken, this.imageID,
      this.setImageID, this.child,
      {super.key});

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

  void upload(
      {required String backendAddress,
      required String authToken,
      required ImageSource imageSource}) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) {
      return;
    }
    final bs = await crop(image.path);
    if (bs == null) {
      return null;
    }
    final res = await upload_api.upload(
      backendAddress,
      authToken,
      image.name,
      bs,
    );
    setImageID(res.ids[0]);
  }

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {
                            upload(
                                backendAddress: backendAddress,
                                authToken: authToken,
                                imageSource: ImageSource.gallery);
                          },
                          child: const Text("从相册选择")),
                      const Divider(),
                      TextButton(
                          onPressed: () {
                            upload(
                                backendAddress: backendAddress,
                                authToken: authToken,
                                imageSource: ImageSource.camera);
                          },
                          child: const Text("拍摄"))
                    ]));
              });
        },
        child: child);
  }
}
