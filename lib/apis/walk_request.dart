import 'package:little_walk/apis/common.dart';
import 'package:little_walk/blocs/walk_request.dart';

Future<List<WalkRequest>> nearbyWalkRequests(
    List<String> exceptIDs, int pageSize) async {
  final resp =
      await httpGet(path: "/walk_requests", params: {"page_size": pageSize});
  return (resp["list"] as List<Map<String, dynamic>>).map((r) {
    return WalkRequest.fromJSON(r);
  }).toList();
}
