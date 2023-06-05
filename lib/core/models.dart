import 'package:flutter/material.dart' show Widget;

mixin HasTitle {
  abstract String title;
}
mixin HasDescription {
  abstract String description;
}
mixin HasCodeView {
  abstract String filePath;
  abstract String? codeLinkPrefix;
}

abstract class EntityWithTitle with HasTitle {}

abstract class EntityWithDescription with HasDescription {}

abstract class EntityWithCodeView with HasCodeView {}

abstract class BaseEntity {}

abstract class BaseChapterEntity extends BaseEntity
    implements EntityWithTitle {}

abstract class BaseSectionEntity extends BaseEntity
    implements
        EntityWithTitle,
        EntityWithDescription /* , EntityWithCodeView */ {}

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
  // @override
  // String? codeLinkPrefix;
  // @override
  // String filePath;
  final Widget child;
  SectionEntity({
    required this.title,
    required this.description,
    // this.codeLinkPrefix,
    // required this.filePath,
    required this.child,
  });
}
