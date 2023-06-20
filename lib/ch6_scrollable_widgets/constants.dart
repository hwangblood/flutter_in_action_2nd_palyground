import 'package:flutter_in_action_2nd_materials/ch6_scrollable_widgets/se2_single_child_scroll_view.dart';
import 'package:flutter_in_action_2nd_materials/ch6_scrollable_widgets/se3_list_view.dart';
import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show SectionEntity;

final ch6Sections = <SectionEntity>[
  SectionEntity(
    title: '6.2 SingleChildScrollView',
    description: 'SingleChildScrollView 示例',
    child: const Se2SingleChildScrollView(),
  ),
  SectionEntity(
    title: '6.3 ListView',
    description: 'ListView 示例',
    child: const Se3ListView(),
  ),
];
