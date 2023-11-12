import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/app.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/portrait_picker.dart';
import 'package:little_walk/screens/edit_dog.dart';

class DogDetailScreen extends StatelessWidget {
  const DogDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBloc = BlocProvider.of<AppCubit>(context, listen: true);
    final dogBloc = BlocProvider.of<DogCubit>(context, listen: true);
    return Scaffold(
        appBar: AppBar(),
        body: Stack(children: [
          Positioned(
              top: 50,
              left: MediaQuery.of(context).size.width * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 80, left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(dogBloc.state.name),
                              Text(dogBloc.state.gender),
                              Text(dogBloc.state.breed != null
                                  ? dogBloc.state.breed!.name
                                  : "其他")
                            ],
                          )))
                ],
              )),
          Positioned(
              top: 20,
              left: MediaQuery.of(context).size.width * 0.15,
              child: DogPortraitPicker(dogBloc.state.portraitID == null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.cyan[800],
                      child: const Text("不二"))
                  : CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "http://${appBloc.state.backendAddress}/apis/dogs/portraits/${dogBloc.state.portraitID}",
                          headers: {"X-Auth-Token": appBloc.state.authToken!}),
                      child: const Text("不二")))),
          Positioned(
              top: 60,
              right: MediaQuery.of(context).size.width * 0.15,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return BlocProvider.value(
                          value: dogBloc, child: const EditDogScreen());
                    }));
                  },
                  child: const Text("编辑信息")))
        ]));
  }
}
