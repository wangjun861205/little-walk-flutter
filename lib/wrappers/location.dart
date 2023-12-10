import 'package:flutter/material.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/utils/geolocation.dart';

class LocationWrapper extends StatelessWidget {
  final Widget Function(BuildContext,
      {required double longitude, required double latitude}) builder;

  const LocationWrapper({required this.builder, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getCurrentLocation(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorBoundary(error: snapshot.error.toString());
          }
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          return builder(context,
              longitude: snapshot.data!.$1, latitude: snapshot.data!.$2);
        });
  }
}
