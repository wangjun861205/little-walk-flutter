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

Future<UploadResponse> upload(
    String authToken, String filename, Uint8List fileContent) async {
  final request = http.MultipartRequest(
      "POST", Uri.parse("http://10.0.2.2:8001/files"))
    ..headers.addAll({"X-User-ID": "1", "X-Size-Limit": "1000000"})
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
