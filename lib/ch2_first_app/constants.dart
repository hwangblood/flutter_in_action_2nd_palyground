import 'se1_counter.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show SectionEntity;

final ch2Sections = <SectionEntity>[
  SectionEntity(
    title: '2.1 计数器应用示例',
    description: '计数器应用',
    child: const Se1Counter(),
  )
];
