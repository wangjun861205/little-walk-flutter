import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/list.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/dog_avatar.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/screens/walk_request_detail.dart';

class WalkRequestList extends StatelessWidget {
  const WalkRequestList({super.key});

  @override
  Widget build(BuildContext context) {
    final reqsBloc = BlocProvider.of<ListCubit<WalkRequest>>(context);
    if (reqsBloc.state.isEmpty) {
      return const Center(child: Text("暂无记录"));
    }
    return ListView(
        children: reqsBloc.state
            .map((req) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (_) => WalkRequestCubit(req),
                          child: const WalkRequestDetailPage())));
                },
                child: Row(children: [
                  ...req.dogs
                      .map((dog) => BlocProvider(
                          create: (_) => DogCubit(dog),
                          child: const DogAvatar(radius: 40)))
                      .toList(),
                  ...req.dogs
                      .map((dog) => Container(
                          margin: const EdgeInsets.only(left: 20),
                          child: Text(dog.name)))
                      .toList()
                ])))
            .toList());
  }
}
