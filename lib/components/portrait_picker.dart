import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PortraitPicker extends StatelessWidget {
  late Function(XFile) setImage;
  PortraitPicker(void Function(XFile) setImage, {super.key});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () async {
          final image =
              await ImagePicker().pickImage(source: ImageSource.gallery);
          if (image == null) {
            return;
          }
          setImage(image);
        },
        child: const Text("选取照片"));
  }
}
