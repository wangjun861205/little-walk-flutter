import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/common.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/exceptions.dart';
import 'package:little_walk/screens/dog_detail.dart';
import 'package:little_walk/screens/login.dart';
import '../models/dog.dart';

class MyDogsListScreen extends StatelessWidget {
  const MyDogsListScreen({super.key});

  Future<(List<Dog>, int)> fetch() async {
    final authToken = await getAuthToken();
    if (authToken == null) {
      throw UnauthorizedException();
    }
    return await myDogs(authToken, 1, 10);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            if (snapshot.error == UnauthorizedException) {
              return const LoginScreen(60);
            }
            return Center(child: Text("${snapshot.error}"));
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scaffold(
            appBar: AppBar(),
            body: ListView.builder(
                itemCount: snapshot.data?.$2,
                itemBuilder: (context, i) {
                  return ListTile(
                      title: Text("${snapshot.data?.$1[i].name}"),
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BlocProvider(
                              create: (_) => DogCubit(snapshot.data!.$1[i]),
                              child: const DogDetailScreen()))));
                }),
          );
        });
  }
}
