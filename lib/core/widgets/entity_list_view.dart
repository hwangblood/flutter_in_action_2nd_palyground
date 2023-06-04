import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart';

import 'widgets.dart';

class EntityListView<T extends BaseEntity> extends StatelessWidget {
  final Iterable<T> entities;
  const EntityListView({
    super.key,
    required this.entities,
  });

  @override
  Widget build(BuildContext context) {
    return entities.isEmpty
        ? const Center(
            child: Text('empty'),
          )
        : ListView.separated(
            itemBuilder: (ctx, index) {
              final entity = entities.elementAt(index);

              if (entity is BaseChapterEntity) {
                return ChapterEntityTile(
                  entity: entity as ChapterEntity,
                );
              }
              if (entity is BaseSectionEntity) {
                return SectionEntityTile(
                  entity: entity as SectionEntity,
                );
              }

              // couldn't reach this point
              return const SizedBox.shrink();
            },
            separatorBuilder: (ctx, index) => const Divider(),
            itemCount: entities.length,
          );
  }
}
