import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/common.dart';
import 'package:little_walk/blocs/dog.dart';
import 'package:little_walk/components/dog_avatar.dart';
import 'package:little_walk/components/dog_overview_card.dart';
import 'package:little_walk/models/dog.dart';
import 'package:little_walk/screens/error_boundary.dart';

class DogSelect extends StatelessWidget {
  final List<Dog> selected;
  final void Function(Dog dog) onTap;
  const DogSelect({required this.selected, required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    final futureBloc =
        BlocProvider.of<FutureCubit<List<Dog>, int>>(context, listen: true);

    switch (futureBloc.state.result.status) {
      case LoadStatus.error:
        return ErrorBoundary(error: futureBloc.state.result.error.toString());
      case LoadStatus.loading:
        return const Center(child: CircularProgressIndicator());
      default:
        List<Widget> selectedAvatars = selected
            .map((dog) => BlocProvider(
                create: (_) => DogCubit(
                    (futureBloc.state.result.data as List<Dog>)
                        .firstWhere((d) => d == dog)),
                child: const Expanded(child: DogAvatar())))
            .toList();
        List<Widget> candidates = (futureBloc.state.result.data as List<Dog>)
            .map((dog) => InkWell(
                onTap: () => onTap(dog),
                child: BlocProvider(
                    create: (_) => DogCubit(dog),
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: const DogOverviewCard(),
                    ))))
            .toList();
        return Column(
            children: [Row(children: selectedAvatars), ...candidates]);
    }
  }
}
