import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/screens/error_boundary.dart';

class CreateWalkRequestButton extends StatelessWidget {
  const CreateWalkRequestButton({super.key});

  @override
  Widget build(BuildContext context) {
    final req = BlocProvider.of<CreateWalkRequestCubit>(context);
    if (req.error != null) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              ErrorBoundary(error: req.error!, retry: () => req.next())));
      return Container();
    }
    if (req.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    if (req.state != null) {
      Navigator.of(context).pop();
      return Container();
    }
    return TextButton(
        onPressed: () {
          req.next();
        },
        child: const Text("创建"));
  }
}
