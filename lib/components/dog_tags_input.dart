import 'package:flutter/material.dart';
import 'package:flutter_tags/flutter_tags.dart';

class DogTagsInput extends StatelessWidget {
  final List<String> tags;
  final void Function(String) addTag;
  final void Function(String) removeTag;
  const DogTagsInput(this.tags, this.addTag, this.removeTag, {super.key});

  @override
  Widget build(BuildContext context) {
    return Tags(
      key: super.key,
      textField: TagsTextField(
        onSubmitted: (val) => addTag(val),
      ),
      itemCount: tags.length,
      itemBuilder: (int idx) {
        final item = tags[idx];
        return ActionChip(
          key: Key(item),
          label: Text(item),
          onPressed: () {
            removeTag(item);
          },
        );
      },
    );
  }
}
