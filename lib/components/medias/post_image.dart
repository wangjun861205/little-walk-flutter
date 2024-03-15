import 'package:flutter/material.dart';
import 'package:little_walk/main.dart';

class PostImage extends StatelessWidget {
  final String imageURL;
  final double width;
  final double height;

  const PostImage(
      {required this.imageURL,
      required this.width,
      required this.height,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: Image.network(imageURL,
            loadingBuilder: (context, widget, event) =>
                const Center(child: CircularProgressIndicator()),
            errorBuilder: (context, error, stack) =>
                Center(child: Text(error.toString())),
            fit: BoxFit.contain,
            headers: {"Authorization": "Bearer ${AuthToken.token}"}));
  }
}
