import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class AcceptWalkRequestButton extends StatelessWidget {
  const AcceptWalkRequestButton({super.key});
  @override
  Widget build(BuildContext context) {
    final accept =
        BlocProvider.of<AcceptWalkRequestCubit>(context, listen: true);
    if (accept.error != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ErrorBoundary(error: accept.error!, retry: () => accept.next())));
      return Container();
    }
    if (accept.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return TextButton(
        onPressed: () {
          accept.next();
        },
        child: const Text("接单"));
  }
}
