import 'package:background_location/background_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class FinishWalkRequestButton extends StatelessWidget {
  const FinishWalkRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context);
    return TextButton(
        onPressed: () {
          BackgroundLocation.stopLocationService();
          finishWalkRequest(reqBloc.state.id).then((res) {
            reqBloc.setFinishedAt(res.finishedAt!);
            Navigator.of(context).pop();
          },
              onError: (e) => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ErrorBoundary(error: e.toString()))));
        },
        child: const Text("结束"));
  }
}
