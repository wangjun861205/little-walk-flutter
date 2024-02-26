import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class CancelWalkRequestButton extends StatelessWidget {
  const CancelWalkRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cancel =
        BlocProvider.of<CancelWalkRequestCubit>(context, listen: true);
    if (cancel.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (cancel.error != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ErrorBoundary(
              error: cancel.error!,
              retry: () {
                cancel.next();
              })));
    }
    return TextButton(
        onPressed: () {
          cancel.next();
        },
        child: const Text("取消"));
  }
}
