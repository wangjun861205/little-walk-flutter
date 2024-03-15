import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/components/utils.dart';
import 'package:little_walk/models/upload.dart';
import 'package:little_walk/screens/login.dart';

class UploadMediaButton extends StatelessWidget {
  final ImageSource source;
  final Function(List<UploadedFile> medias) addMedias;
  const UploadMediaButton(
      {required this.source, required this.addMedias, super.key});

  @override
  Widget build(BuildContext context) {
    return source == ImageSource.gallery
        ? IconButton(
            onPressed: () {
              final httpClient = HttpClient.fromEnv();
              ImagePicker().pickMultipleMedia().then((files) {
                if (files.isEmpty) {
                  return;
                }
                httpClient
                    .upload(files.map((f) => File(f.path)).toList())
                    .then((medias) => addMedias(medias), onError: (err) {
                  if (err is DioException) {
                    if (err.error == errorUnauthorized) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                      return;
                    }
                  }
                  showErrorMessage(context, err);
                }).onError((e, stack) {
                  if (e is DioException) {
                    if (e.error == errorUnauthorized) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                      return;
                    }
                  }
                  showErrorMessage(context, e!);
                });
              });
            },
            icon: const Icon(Icons.image))
        : IconButton(
            onPressed: () {
              final httpClient = HttpClient.fromEnv();
              ImagePicker().pickImage(source: ImageSource.camera).then((file) {
                if (file == null) {
                  return;
                }
                httpClient
                    .upload([File(file.path)])
                    .then(
                      (medias) => addMedias(medias),
                    )
                    .onError((e, stack) {
                      if (e is DioException) {
                        if (e.error == errorUnauthorized) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                          return;
                        }
                      }
                      showErrorMessage(context, e!);
                    });
              });
            },
            icon: const Icon(Icons.camera_alt));
  }
}
