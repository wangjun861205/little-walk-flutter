import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/walk_request.dart';

class WalkRequestList extends StatelessWidget {
  const WalkRequestList({super.key});
  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestListCubit>(context);
    return ListView.builder(itemBuilder: (context, i) {
      return ListTile(title: Text(reqBloc.state[i].dog.name));
    });
  }
}
