import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:http/http.dart';
import 'package:little_walk/apis/exceptions.dart';
part 'common.freezed.dart';
part 'common.g.dart';

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

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    required int page,
    required int size,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}

// 将所生成参数展平使其可以放到url中进行发送
Map<String, dynamic> flattenParams(Map<String, dynamic> values) {
  for (var key in values.keys.toList()) {
    if (values[key] is Map<String, dynamic>) {
      final val = values.remove(key);
      final nextMap = flattenParams(val);
      for (var entry in nextMap.entries) {
        values[entry.key] = entry.value;
      }
      continue;
    }
    if (values[key] is List) {
      final val = values.remove(key);
      final jsonStr = jsonEncode(val);
      values[key] = jsonStr;
    }
  }
  return values;
}

// 将Object转化为url参数
Map<String, dynamic>? toParams<T>(T? obj) {
  if (obj == null) {
    return null;
  }
  final jsonStr = jsonEncode(obj);
  final json = jsonDecode(jsonStr);
  return flattenParams(json);
}

// http get
Future<dynamic> httpGet<T>({required String path, T? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, toParams(params));
  final resp = await get(url,
      headers: authToken != null ? {authTokenHeader: authToken} : null);
  if (resp.statusCode != 200) {
    throw APIException(resp.statusCode, resp.body);
  }
  return jsonDecode(utf8.decode(resp.bodyBytes));
}

// 上传文件
Future<Map<String, dynamic>> httpUploadFile<T>(
    {required String path,
    required List<MultipartFile> files,
    T? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, toParams(params));
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

// http post json
Future<Map<String, dynamic>> httpPostJson<T>(
    {required String path,
    required Map<String, dynamic> obj,
    T? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, toParams(params));
  Map<String, String> headers = {"Content-Type": "application/json"};
  if (authToken != null) {
    headers[authTokenHeader] = authToken;
  }
  final resp = await post(url, headers: headers, body: jsonEncode(obj));
  if (resp.statusCode != 200) {
    return Future.error(
        APIException(resp.statusCode, utf8.decode(resp.bodyBytes)));
  }
  if (resp.body == "") {
    return {};
  }
  return jsonDecode(resp.body);
}

// http put json
Future<Map<String, dynamic>> httpPutJson<T>(
    {required String path,
    required Map<String, dynamic> obj,
    T? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, toParams(params));
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

// http put without body
Future<Map<String, dynamic>?> httpPutWithoutBody<T>(
    {required String path, T? params}) async {
  final backendAddress = dotenv.get("BACKEND_ADDRESS");
  final authToken = await getAuthToken();
  final url = Uri.http(backendAddress, path, toParams(params));
  Map<String, String> headers = {"Content-Type": "application/json"};
  if (authToken != null) {
    headers[authTokenHeader] = authToken;
  }
  final resp = await put(url, headers: headers);
  if (resp.statusCode != 200) {
    debugPrint(resp.body);
    throw APIException(resp.statusCode, resp.body);
  }
  if (resp.body.isNotEmpty) {
    return jsonDecode(resp.body);
  }
  return null;
}
