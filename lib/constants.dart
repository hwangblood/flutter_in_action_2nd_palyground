import 'package:flutter_in_action_2nd_materials/ch2_first_app/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch3_basic_widgets/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch4_layout_widgets/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch5_container_widgets/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch6_scrollable_widgets/constants.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show ChapterEntity;

final allChapters = <ChapterEntity>[
  ChapterEntity(
    title: '第二章：第一个Flutter应用',
    examples: ch2Examples,
  ),
  ChapterEntity(
    title: '第三章：基础组件',
    examples: ch3Examples,
  ),
  ChapterEntity(
    title: '第四章：布局类组件',
    examples: ch4Examples,
  ),
  ChapterEntity(
    title: '第五章：容器类组件',
    examples: ch5Examples,
  ),
  ChapterEntity(
    title: '第六章：可滚动组件',
    examples: ch6Examples,
  ),
];
