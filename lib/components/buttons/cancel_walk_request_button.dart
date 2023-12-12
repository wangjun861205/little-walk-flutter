import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class CancelWalkRequestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          cancelWalkRequest(reqBloc.state.id).then((res) {
            reqBloc.setCanceledAt(res.canceledAt!);
          }, onError: (e) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ErrorBoundary(error: e.toString())));
          });
        },
        child: const Text("取消"));
  }
}
