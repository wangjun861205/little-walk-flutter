import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/blocs/list.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/screens/my_dogs_list.dart';
import 'package:little_walk/screens/walk_request_list.dart';

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
              onTap: () async {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return BlocProvider(
                      create: (_) => FutureCubit<List<Dog>, int>(
                          factory: (prev, skip) async {
                            final dogs = await myDogs(limit: 10, skip: skip);
                            prev ?? [].addAll(dogs);
                            return Future.value(dogs);
                          },
                          initData: [],
                          arg: 0),
                      child: const MyDogsListScreen());
                }));
              },
            ),
            ListTile(
                title: const Text("我的订单"),
                onTap: () async {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => FutureCubit<List<WalkRequest>, int>(
                              factory: (prev, page) async {
                                final curr = await myWalkRequests(page: page);
                                return [...(prev ?? []), ...curr];
                              },
                              initData: [],
                              arg: 1),
                          child: const WalkRequestListScreen())));
                }),
            const ListTile(title: Text("登出")),
          ],
        ));
  }
}
