import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tags/flutter_tags.dart';
import 'package:little_walk/blocs/dog.dart';

class DogTagsInput extends StatelessWidget {
  const DogTagsInput({super.key});

  @override
  Widget build(BuildContext context) {
    final dogBloc = BlocProvider.of<DogValueCubit>(context);
    return Tags(
      key: super.key,
      textField: TagsTextField(
        onSubmitted: (val) => dogBloc.state,
      ),
      itemCount: dogBloc.state.tags?.length ?? 0,
      itemBuilder: (int idx) {
        final item = dogBloc.state.tags?[idx];
        return ActionChip(
          key: Key(item!),
          label: Text(item),
          onPressed: () {
            var tags = dogBloc.state.tags == null
                ? List<String>.empty()
                : dogBloc.state.tags!;
            tags.remove(item);
            dogBloc.setTags(tags);
          },
        );
      },
    );
  }
}
