import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class AcceptWalkRequestButton extends StatelessWidget {
  const AcceptWalkRequestButton({super.key});
  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context, listen: true);
    return TextButton(
        onPressed: () async {
          try {
            acceptWalkRequest(reqBloc.state.id).then((res) {
              reqBloc.setAcceptedBy(res.acceptedBy!);
              reqBloc.setAcceptedAt(res.acceptedAt!);
            });
          } catch (e) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ErrorBoundary(error: e.toString())));
          }
        },
        child: const Text("接单"));
  }
}
