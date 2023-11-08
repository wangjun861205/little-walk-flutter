import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class UploadResponse {
  List<String> ids;

  UploadResponse(this.ids);
  factory UploadResponse.fromJSON(String json) {
    final map = jsonDecode(json);
    final ids =
        (map["ids"] as List<dynamic>).map((id) => id as String).toList();
    return UploadResponse(ids);
  }
}

Future<UploadResponse> upload(String backendAddress, authToken, String filename,
    Uint8List fileContent) async {
  final request = http.MultipartRequest(
      "POST", Uri.http(backendAddress, "/apis/dogs/portraits"))
    ..headers.addAll({"X-Auth-Token": authToken})
    ..files.add(
        http.MultipartFile.fromBytes("file", fileContent, filename: filename));
  final resp = await request.send();
  if (resp.statusCode != 200) {
    throw Exception(
        "failed to upload file(status: ${resp.statusCode}): ${await resp.stream.bytesToString()}");
  }
  final body = await resp.stream.bytesToString();
  return UploadResponse.fromJSON(body);
}
