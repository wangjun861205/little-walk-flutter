import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:little_walk/blocs/dog.dart';

class Tag extends StatelessWidget {
  final String tag;

  const Tag(this.tag, {super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);
    return InkWell(
        onTap: () => dogBloc.removeTag(tag),
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: Colors.lightBlue[400],
                borderRadius: const BorderRadius.all(Radius.circular(15))),
            child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: SizedBox(height: 30, child: Text(tag)))));
  }
}

class InputSuit extends StatelessWidget {
  const InputSuit({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);
    var controller = TextEditingController();
    return Wrap(children: [
      SizedBox(
          width: 80,
          height: 30,
          child: TextField(
            controller: controller,
          )),
      SizedBox(
          width: 40,
          height: 30,
          child: TextButton(
              onPressed: () => dogBloc.pushTag(controller.text),
              child: const Text("添加"))),
    ]);
  }
}

class TagsEditor extends StatelessWidget {
  const TagsEditor({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context, listen: true);

    return Wrap(
        children: (dogBloc.state.tags ?? [])
            .map((t) => Flexible(child: Tag(t)))
            .toList()
          ..add(const Flexible(child: InputSuit())));
  }
}
