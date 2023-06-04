import 'package:flutter/material.dart' show Widget;

mixin HasTitle {
  abstract String title;
}
mixin HasDescription {
  abstract String description;
}

abstract class EntityWithTitle with HasTitle {}

abstract class EntityWithDescription with HasDescription {}

abstract class BaseEntity {}

abstract class BaseChapterEntity extends BaseEntity
    implements EntityWithTitle {}

abstract class BaseSectionEntity extends BaseEntity
    implements EntityWithTitle, EntityWithDescription {}

class ChapterEntity extends BaseChapterEntity {
  @override
  String title;
  final Iterable<SectionEntity> sections;

  ChapterEntity({
    required this.title,
    required this.sections,
  });
}

class SectionEntity extends BaseSectionEntity {
  @override
  String title;
  @override
  String description;
  final Widget child;
  SectionEntity({
    required this.title,
    required this.description,
    required this.child,
  });
}
