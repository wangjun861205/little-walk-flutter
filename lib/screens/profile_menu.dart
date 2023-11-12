import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/screens/my_dogs_list.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: ListView(
          children: [
            const ListTile(title: Text("个人信息")),
            ListTile(
              title: const Text("我的狗狗"),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocProvider.value(
                      value: BlocProvider.of<AppCubit>(context),
                      child: const MyDogsListScreen());
                }));
              },
            ),
            const ListTile(title: Text("登出")),
          ],
        ));
  }
}
