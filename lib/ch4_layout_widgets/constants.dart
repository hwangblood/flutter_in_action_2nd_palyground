import 'package:flutter_in_action_2nd_materials/ch4_layout_widgets/se2_constraints.dart';
import 'package:flutter_in_action_2nd_materials/ch4_layout_widgets/se3_linear_layout.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show SectionEntity;

final ch4Sections = <SectionEntity>[
  SectionEntity(
    title: '4.2 布局原理与约束（constraints）',
    description: '布局原理与约束（constraints）',
    child: const Se2Constraints(),
  ),
  SectionEntity(
    title: '4.3 线性布局（Row和Column）',
    description: '线性布局（Row和Column）',
    child: const Se3LinearLayout(),
  ),
];
