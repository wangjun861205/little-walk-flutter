import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/dog_avatar.dart';
import 'package:little_walk/models/walk_request.dart';
import 'package:little_walk/screens/walk_request_detail.dart';

class WalkRequestList extends StatelessWidget {
  final List<WalkRequest> requests;

  const WalkRequestList({required this.requests, super.key});

  @override
  Widget build(BuildContext context) {
    if (requests.isEmpty) {
      return const Center(child: Text("暂无记录"));
    }
    return ListView.builder(
        itemCount: requests.length,
        itemBuilder: (context, i) {
          return ListTile(
              onTap: () => {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BlocProvider(
                            create: (_) => WalkRequestCubit(requests[i]),
                            child: const WalkRequestDetailPage())))
                  },
              leading: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: requests[i].dogs.map((dog) {
                      return BlocProvider(
                          create: (_) => DogCubit(dog),
                          child: const DogAvatar());
                    }).toList(),
                  )),
              title:
                  Text((requests[i].dogs).map((dog) => dog.name).join(", ")));
        });
  }
}
