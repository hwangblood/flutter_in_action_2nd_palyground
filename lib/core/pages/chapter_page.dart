import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show ChapterEntity;
import 'package:flutter_in_action_2nd_materials/core/widgets/widgets.dart'
    show EntityListView;

class ChapterPage extends StatelessWidget {
  final ChapterEntity chapter;
  const ChapterPage({
    super.key,
    required this.chapter,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chapter.title),
      ),
      body: EntityListView(
        entities: chapter.sections,
      ),
    );
  }
}
