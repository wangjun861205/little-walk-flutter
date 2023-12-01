import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/utils/geolocation.dart';

Future<List<WalkRequest>> nearbyWalkRequests(int page, int size) async {
  final (longitude, latitude) = await getCurrentLocation();
  final resp = await httpGet(path: "/apis/walk_requests/nearby", params: {
    "page": page.toString(),
    "size": size.toString(),
    "longitude": longitude.toString(),
    "latitude": latitude.toString(),
    "radius": 10.toString(),
  });
  return (resp as List<dynamic>).map((r) {
    return WalkRequest.fromJson(r);
  }).toList();
}

Future<void> createWalkRequest(WalkRequest request) async {
  await httpPostJson(path: "/apis/walk_requests", obj: request.toJson());
}
