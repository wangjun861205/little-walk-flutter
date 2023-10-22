import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

class LoginResponse {
  String token;

  LoginResponse(this.token);

  factory LoginResponse.fromJSON(String json) {
    Map<String, dynamic> m = jsonDecode(json);
    return LoginResponse(m["token"]);
  }
}

Future<void> acquireSMSVerificationCode(String phone) async {
  final uri = Uri.parse("http://10.0.2.2:8002/$phone");
  final resp = await put(uri);
  if (resp.statusCode != 200) {
    log("获取验证码失败(status code: ${resp.statusCode}): ${resp.body}");
    throw Exception("获取验证码失败");
  }
}

Future<String> loginByVerificationCode(String phone, code) async {
  try {
    final uri = Uri.http("10.0.2.2:8003", "/login_by_verification_code",
        {"phone": phone, "code": code});
    final resp = await put(uri);
    if (resp.statusCode != 200) {
      throw Exception(resp.body);
    }
    LoginResponse loginResp = LoginResponse.fromJSON(resp.body);
    return loginResp.token;
  } catch (err) {
    throw Exception("登录失败: ${err.toString()}");
  }
}
