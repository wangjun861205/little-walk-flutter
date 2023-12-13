import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/screens/walk_request_walking.dart';

class StartWalkRequestButton extends StatelessWidget {
  const StartWalkRequestButton({super.key});
  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context, listen: true);
    return TextButton(
        onPressed: () {
          startWalkRequest(reqBloc.state.id).then((res) {
            reqBloc.setStartedAt(res.startedAt!);
            Navigator.of(context)
                .push(MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                        value: reqBloc, child: const WalkRequestWalkingPage())))
                .then((finishedAt) {
              reqBloc.setFinishedAt(finishedAt as DateTime);
            });
          }, onError: (e) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ErrorBoundary(error: e.toString())));
          });
        },
        child: const Text("开始"));
  }
}
