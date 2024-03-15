import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/http_client.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/screens/add_dog.dart';
import 'package:little_walk/screens/error_boundary.dart';

class MyDogsListScreen extends StatelessWidget {
  const MyDogsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MyDogsCubit(client: HttpClient.fromEnv())..query(),
      child: Builder(builder: (context) {
        final dogs = BlocProvider.of<MyDogsCubit>(context);
        if (dogs.state.error != null) {
          return ErrorBoundary(
              error: dogs.state.error!, retry: () => dogs.query());
        }
        if (dogs.state.isLoading) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
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
                          .then((val) {
                        dogs.query();
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
      }),
    );
  }
}
