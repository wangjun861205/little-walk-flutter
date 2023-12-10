import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/apis/walk_request.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';
import 'package:little_walk/utils/geolocation.dart';

class CreateWalkRequestButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestValueCubit>(context);
    return TextButton(
        onPressed: () {
          createWalkRequest(reqBloc.state).then((_) {
            Navigator.of(context).pop();
          }).onError((error, stackTrace) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return ErrorBoundary(error: error.toString());
            }));
          });
        },
        child: const Text("创建"));
  }
}
