import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import '../apis/upload.dart' as upload_api;

class PortraitPickerState extends State<PortraitPicker> {
  String? imageURL;
  late ScaffoldMessengerState messager;

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

  void upload() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final bs = await crop(image.path);
    if (bs == null) {
      return null;
    }
    final res = await upload_api.upload(
      "",
      image.name,
      bs,
    );
    widget.setPortrait(res.ids[0]);
    setState(() {
      imageURL = res.ids[0];
    });
  }

  @override
  Widget build(BuildContext context) {
    messager = ScaffoldMessenger.of(context);
    return (imageURL != null)
        ? Row(children: [
            TextButton(onPressed: upload, child: const Text("选取照片")),
            GestureDetector(
                onTap: () {
                  widget.setPortrait(null);
                  setState(() => imageURL = null);
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      "http://10.0.2.2:8001/files/$imageURL",
                      scale: 0.2),
                ))
          ])
        : Row(children: [
            TextButton(onPressed: upload, child: const Text("选取照片")),
          ]);
  }
}

class PortraitPicker extends StatefulWidget {
  final Function(String?) setPortrait;

  const PortraitPicker(this.setPortrait, {super.key});

  @override
  State<StatefulWidget> createState() {
    return PortraitPickerState();
  }
}
