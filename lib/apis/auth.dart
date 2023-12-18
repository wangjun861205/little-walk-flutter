import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/exceptions.dart';

class LoginResponse {
  String token;

  LoginResponse(this.token);

  factory LoginResponse.fromJSON(Map<String, dynamic> json) {
    return LoginResponse(json["token"]);
  }
}

Future<void> acquireSMSVerificationCode(String phone) async {
  try {
    await httpPutWithoutBody(
        path: "/accounts/phones/$phone/verification_codes");
  } on APIException catch (e) {
    throw Exception("获取验证码失败: $e");
  } catch (e) {
    throw Exception("网络异常： $e");
  }
}

Future<String> loginByVerificationCode(String phone, code) async {
  try {
    final resp = await httpPutJson(
        path: "/accounts/login/by_sms_verification_code",
        obj: {"phone": phone, "code": code});
    LoginResponse loginResp = LoginResponse.fromJSON(resp);
    return loginResp.token;
  } on APIException catch (err) {
    throw Exception("登录失败(status: ${err.statusCode}, cause: ${err.cause})");
  } catch (e) {
    throw Exception("网络异常: $e");
  }
}

class VerifyTokenResp {
  String id;

  VerifyTokenResp(this.id);

  factory VerifyTokenResp.fromJSON(String json) {
    final m = jsonDecode(json);
    return VerifyTokenResp(m["id"]);
  }
}

Future<String?> verifyToken(String token) async {
  try {
    final uri =
        Uri.http("10.0.2.2:8000", "/accounts/tokens/$token/verification");
    final resp = await get(uri);
    if (resp.statusCode == HttpStatus.unauthorized) {
      return null;
    }
    if (resp.statusCode != 200) {
      throw Exception(resp.body);
    }
    final body = VerifyTokenResp.fromJSON(resp.body);
    return body.id;
  } catch (err) {
    throw Exception("验证Token失败: $err");
  }
}

Future<String> signup(String phone, password, verificationCode) async {
  final address = dotenv.get("BACKEND_ADDRESS");
  final uri = Uri.http(address, "/accounts/signup");
  final resp = await post(uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "phone": phone,
        "password": password,
        "verification_code": verificationCode
      }));
  if (resp.statusCode != HttpStatus.ok) {
    throw Exception("注册失败: ${resp.body}");
  }
  Map<String, dynamic> map = jsonDecode(resp.body);
  return map["token"];
}
