import 'package:flutter/material.dart';
import 'package:little_walk/apis/dog.dart';
import 'package:little_walk/models/walk_request.dart';

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
              leading: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: requests[i].dogs!.map((dog) {
                      return CircleAvatar(
                          radius: 40,
                          backgroundImage: NetworkImage(
                              "http://10.0.2.2:9000/apis/dogs/portraits/${dog.portraitID}"));
                    }).toList(),
                  )),
              title: Text((requests[i].dogs! ?? [])
                  .map((dog) => dog.name!)
                  .join(", ")));
        });
  }
}
