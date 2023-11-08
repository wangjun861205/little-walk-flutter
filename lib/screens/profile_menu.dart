import 'package:flutter/material.dart';
import 'package:little_walk/screens/my_dogs_list.dart';

class ProfileMenuScreen extends StatelessWidget {
  final String backendAddress;
  final String authToken;
  const ProfileMenuScreen(this.backendAddress, this.authToken, {super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const ListTile(title: const Text("个人信息")),
            ListTile(
              title: const Text("我的狗狗"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MyDogsListScreen(backendAddress, authToken);
                }));
              },
            ),
            const ListTile(title: Text("登出")),
          ],
        ));
  }
}
