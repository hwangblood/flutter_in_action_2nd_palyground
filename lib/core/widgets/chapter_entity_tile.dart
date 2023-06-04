import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/core/pages/pages.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show ChapterEntity;

class ChapterEntityTile extends StatelessWidget {
  final ChapterEntity entity;
  const ChapterEntityTile({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entity.title),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChapterPage(
              chapter: entity,
            ),
          ),
        );
      },
    );
  }
}
