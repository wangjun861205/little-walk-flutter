import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:little_walk/apis/common.dart';

class LoginResponse {
  String token;

  LoginResponse(this.token);

  factory LoginResponse.fromJSON(String json) {
    Map<String, dynamic> m = jsonDecode(json);
    return LoginResponse(m["token"]);
  }
}

Future<void> acquireSMSVerificationCode(String phone) async {
  final uri = Uri.parse(
      "http://10.0.2.2:8000/accounts/phones/$phone/verification_codes");
  final resp = await put(uri);
  if (resp.statusCode != 200) {
    throw Exception("获取验证码失败(status: ${resp.statusCode}): ${resp.body}");
  }
}

Future<String> loginByVerificationCode(String phone, code) async {
  try {
    final uri = Uri.http(
      "10.0.2.2:8000",
      "/accounts/login/by_sms_verification_code",
    );
    final resp = await put(uri,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"phone": phone, "code": code}));
    if (resp.statusCode != 200) {
      throw Exception("status: ${resp.statusCode}, detail: ${resp.body}");
    }
    LoginResponse loginResp = LoginResponse.fromJSON(resp.body);
    return loginResp.token;
  } catch (err) {
    throw Exception("登录失败: $err");
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
