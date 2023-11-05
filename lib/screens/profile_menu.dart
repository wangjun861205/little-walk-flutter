import 'package:flutter/material.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: const [
            ListTile(title: Text("个人信息")),
            ListTile(title: Text("我的狗狗")),
            ListTile(title: Text("登出")),
          ],
        ));
  }
}
