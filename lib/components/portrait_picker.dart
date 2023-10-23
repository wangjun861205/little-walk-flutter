import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';

class PortraitPicker extends StatelessWidget {
  final Function(String) setPortrait;
  final Uri uploadURL;
  late ScaffoldMessengerState messager;
  PortraitPicker(this.setPortrait, this.uploadURL, {super.key});

  void upload() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final croppedImage = await ImageCropper().cropImage(
      sourcePath: image.path,
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
        // WebUiSettings(
        //   context: context,
        // ),
      ],
    );
    if (croppedImage == null) {
      return;
    }
    final bs = await croppedImage.readAsBytes();
    final request = http.MultipartRequest("POST", uploadURL)
      ..headers.addAll({"X-User-ID": "1", "X-Size-Limit": "1000000"})
      ..files.add(http.MultipartFile.fromBytes("file", bs));
    final resp = await request.send();
    if (resp.statusCode != 200) {
      messager.showSnackBar(SnackBar(
          content: Text(
              "上传失败(status code:  ${resp.statusCode}): ${await resp.stream.transform(utf8.decoder).join()}")));
      return;
    }
    final body = await resp.stream.bytesToString();
    print(body);
    final data = jsonDecode(body);
    setPortrait(data["id"]);
  }

  @override
  Widget build(BuildContext context) {
    messager = ScaffoldMessenger.of(context);
    return TextButton(onPressed: upload, child: const Text("选取照片"));
  }
}
