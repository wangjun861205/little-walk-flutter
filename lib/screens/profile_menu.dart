import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walking_offer.dart';
import 'package:little_walk/screens/my_dogs_list.dart';
import 'package:little_walk/screens/my_walking_offers.dart';

class ProfileMenuScreen extends StatelessWidget {
  const ProfileMenuScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
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
                          create: (_) =>
                              MyDogsCubit(client: HttpClient.fromEnv()),
                          child: const MyDogsListScreen());
                    }));
                  },
                ),
                ListTile(
                    title: const Text("我的订单"),
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                              create: (_) => MyWalkingOffersCubit(
                                  client: HttpClient.fromEnv()),
                              child: const MyWalkingOffersScreen())));
                    }),
                const ListTile(title: Text("登出")),
              ],
            )));
  }
}
