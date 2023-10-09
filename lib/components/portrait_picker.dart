import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class PortraitPicker extends StatelessWidget {
  late Function(String) setPortrait;
  late Uri uploadURL;
  late ScaffoldMessengerState messager;
  PortraitPicker(this.setPortrait, this.uploadURL, {super.key});

  void upload() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) {
      return;
    }
    final request = http.MultipartRequest("POST", uploadURL)
      ..files.add(http.MultipartFile(
          "file", image.openRead(), await image.length(),
          filename: image.name));
    final resp = await request.send();
    if (resp.statusCode != 200) {
      messager.showSnackBar(
          SnackBar(content: Text("上传失败(status code:  ${resp.statusCode})")));
      return;
    }
    final data = jsonDecode(resp.stream.toString());
    setPortrait(data["id"]);
  }

  @override
  Widget build(BuildContext context) {
    messager = ScaffoldMessenger.of(context);
    return TextButton(onPressed: upload, child: const Text("选取照片"));
  }
}
