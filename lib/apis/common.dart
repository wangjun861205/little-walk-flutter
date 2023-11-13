import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:little_walk/apis/exceptions.dart';

class ListResp<T> {
  List<T> list;
  int total;

  ListResp(this.list, this.total);
}

const authTokenKey = "AUTH_TOKEN";
const authTokenHeader = "X-Auth-Token";

Future<String?> getAuthToken() async {
  const store = FlutterSecureStorage();
  return store.read(key: authTokenKey);
}

Future<void> putAuthToken(String token) async {
  const store = FlutterSecureStorage();
  return store.write(key: authTokenKey, value: token);
}

class Pagination {
  int page;
  int size;
  Pagination(this.page, this.size);
}

Future<Map<String, dynamic>> httpGet(
    {required String path, Map<String, dynamic>? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, params);
  final resp = await get(url,
      headers: authToken != null ? {authTokenHeader: authToken} : null);
  if (resp.statusCode != 200) {
    throw APIException(resp.statusCode, resp.body);
  }
  return jsonDecode(resp.body);
}

Future<Map<String, dynamic>> httpUploadFile(
    {required String path,
    required List<MultipartFile> files,
    Map<String, dynamic>? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, params);
  var request = MultipartRequest("POST", url)..files.addAll(files);
  if (authToken != null) {
    request.headers.addAll({authTokenHeader: authToken});
  }

  final resp = await request.send();
  if (resp.statusCode != 200) {
    final reason = await resp.stream.bytesToString();
    debugPrint(reason);
    throw APIException(resp.statusCode, reason);
  }
  return jsonDecode(await resp.stream.bytesToString());
}

Future<Map<String, dynamic>> httpPostJson(
    {required String path,
    required Map<String, dynamic> obj,
    Map<String, dynamic>? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, params);
  Map<String, String> headers = {"Content-Type": "application/json"};
  if (authToken != null) {
    headers[authTokenHeader] = authToken;
  }
  final resp = await post(url, headers: headers, body: jsonEncode(obj));
  if (resp.statusCode != 200) {
    throw APIException(resp.statusCode, resp.body);
  }
  return jsonDecode(resp.body);
}

Future<Map<String, dynamic>> httpPutJson(
    {required String path,
    required Map<String, dynamic> obj,
    Map<String, dynamic>? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, params);
  Map<String, String> headers = {"Content-Type": "application/json"};
  if (authToken != null) {
    headers[authTokenHeader] = authToken;
  }
  final resp = await put(url, headers: headers, body: jsonEncode(obj));
  if (resp.statusCode != 200) {
    debugPrint(resp.body);
    throw APIException(resp.statusCode, resp.body);
  }
  return jsonDecode(resp.body);
}
