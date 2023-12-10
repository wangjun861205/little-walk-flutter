import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/blocs/walk_request.dart';
import 'package:little_walk/components/accept_walk_request_button.dart';
import 'package:little_walk/components/dog_overview_card.dart';
import 'package:little_walk/components/start_walk_request_button.dart';

class WalkRequestDetailPage extends StatelessWidget {
  const WalkRequestDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final reqBloc = BlocProvider.of<WalkRequestCubit>(context, listen: true);

    return Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          ...reqBloc.state.dogs
              .map((dog) => BlocProvider(
                  create: (_) => DogCubit(dog), child: const DogOverviewCard()))
              .toList(),
          if (reqBloc.state.canceledAt != null)
            const Text("订单已取消")
          else if (reqBloc.state.finishedAt != null)
            const Text("订单已完成")
          else if (reqBloc.state.acceptedAt != null)
            const StartWalkRequestButton()
          else
            const AcceptWalkRequestButton()
        ]));
  }
}
