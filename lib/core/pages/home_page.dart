import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show ChapterEntity;
import 'package:flutter_in_action_2nd_materials/core/widgets/widgets.dart'
    show EntityListView;

class MainPage extends StatelessWidget {
  final String title;
  final Iterable<ChapterEntity> chapters;
  const MainPage({
    super.key,
    required this.title,
    required this.chapters,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: EntityListView(
        entities: chapters,
      ),
    );
  }
}
