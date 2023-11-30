import 'package:flutter/material.dart';
import 'package:little_walk/apis/common.dart';
// import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/models/walk_request.dart';

Future<List<WalkRequest>> nearbyWalkRequests(int page, int size) async {
  final resp = await httpGet(
      path: "/walk_requests/nearby",
      params: {"page": page.toString(), "size": size.toString()});
  return (resp["list"] as List<Map<String, dynamic>>).map((r) {
    return WalkRequest.fromJson(r);
  }).toList();
}
