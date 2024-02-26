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

Future<List<WalkRequest>> myWalkRequests(
    {required int limit, String? after}) async {
  final resp = await httpGet(
      path: "/apis/walk_requests/mine",
      params: {"limit": limit, "after": after});
  return (resp as List<dynamic>).map((r) {
    return WalkRequest.fromJson(r);
  }).toList();
}

Future<String> createWalkRequest(CreateWalkRequest request) async {
  final resp =
      await httpPostJson(path: "/apis/walk_requests", obj: request.toJson());
  return resp["id"];
}

Future<WalkRequest> acceptWalkRequest(String id) async {
  final resp =
      await httpPutWithoutBody(path: "/apis/walk_requests/$id/accepted_by");
  return WalkRequest.fromJson(resp as Map<String, dynamic>);
}

Future<WalkRequest> startWalkRequest(String id) async {
  final resp = await httpPutWithoutBody(path: "/apis/walk_requests/$id/start");
  return WalkRequest.fromJson(resp as Map<String, dynamic>);
}

Future<void> reportCurrentPosition(
    {required String id, required double longitude, latitude}) async {
  await httpPostJson(
      path: "/apis/walk_requests/$id/locations",
      obj: {"longitude": longitude, "latitude": latitude});
}

Future<WalkRequest> finishWalkRequest(String id) async {
  final resp = await httpPutWithoutBody(path: "/apis/walk_requests/$id/finish");
  return WalkRequest.fromJson(resp as Map<String, dynamic>);
}

Future<WalkRequest> cancelWalkRequest(String id) async {
  final resp = await httpPutWithoutBody(path: "/apis/walk_requests/$id/cancel");
  return WalkRequest.fromJson(resp as Map<String, dynamic>);
}

Future<WalkRequest> getWalkRequest(String id) async {
  final resp = await httpGet(path: "/apis/walk_requests/$id");
  return WalkRequest.fromJson(resp as Map<String, dynamic>);
}
