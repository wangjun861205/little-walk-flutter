import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/pagination.dart';
import 'package:little_walk/exceptions.dart';
import 'package:little_walk/screens/add_dog.dart';
import 'package:little_walk/screens/dog_detail.dart';
import 'package:little_walk/screens/login.dart';
import '../models/dog.dart';

class MyDogsListScreen extends StatelessWidget {
  const MyDogsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final futureBloc =
        BlocProvider.of<FutureCubit<List<Dog>, int>>(context, listen: true);
    switch (futureBloc.state.result.status) {
      case LoadStatus.error:
        if (futureBloc.state.result.error == UnauthorizedException) {
          return const LoginScreen(60);
        }
        return Center(child: Text("${futureBloc.state.result.error}"));
      case LoadStatus.loading:
        return const Center(child: CircularProgressIndicator());
      default:
        if (futureBloc.state.result.data == null ||
            futureBloc.state.result.data!.isEmpty) {
          return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: const Text("我的狗狗"),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(
                                builder: (context) => const AddDogScreen()))
                            .then((val) {
                          futureBloc.refresh();
                        });
                      },
                      child: const Text("添加"))
                ],
              ),
              body: Center(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Flexible(child: Text("还没有添加狗狗, ")),
                  Flexible(
                      child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const AddDogScreen();
                      }));
                    },
                    child: const Text("去添加"),
                  ))
                ]),
              ));
        }
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text("我的狗狗"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => const AddDogScreen()))
                        .then((_) => futureBloc.refresh());
                  },
                  child: const Text("添加"))
            ],
          ),
          body: ListView.builder(
              itemCount: futureBloc.state.result.data?.length,
              itemBuilder: (context, i) {
                return ListTile(
                    title: Text("${futureBloc.state.result.data?[i].name}"),
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                            create: (_) =>
                                DogCubit(futureBloc.state.result.data![i]),
                            child: const DogDetailScreen()))));
              }),
        );
    }
  }
}
