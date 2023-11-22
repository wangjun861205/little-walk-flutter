import 'package:flutter/material.dart';
import 'package:little_walk/blocs/walk_request.dart';

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
          final req = requests[i];
          return ListTile(
              leading: Row(
                children: req.dogs.map((dog) {
                  return CircleAvatar(
                      backgroundImage:
                          NetworkImage("/apis/dogs/avatars/${dog.portraitID}"));
                }).toList(),
              ),
              title: Text(
                  "开始时间: ${req.shouldEndAfter.toIso8601String()}~${req.shouldEndBefore.toIso8601String()}, 结束时间: ${req.shouldEndAfter.toIso8601String()}~${req.shouldEndBefore}"));
        });
  }
}
