import 'package:flutter_in_action_2nd_materials/ch2_first_app/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch3_basic_widgets/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch4_layout_widgets/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch5_container_widgets/constants.dart';
import 'package:flutter_in_action_2nd_materials/ch6_scrollable_widgets/constants.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show ChapterEntity;

import 'ch7_functional_widgets/constants.dart';

final allChapters = <ChapterEntity>[
  ChapterEntity(
    title: '第二章：第一个Flutter应用',
    sections: ch2Sections,
  ),
  ChapterEntity(
    title: '第三章：基础组件',
    sections: ch3Sections,
  ),
  ChapterEntity(
    title: '第四章：布局类组件',
    sections: ch4Sections,
  ),
  ChapterEntity(
    title: '第五章：容器类组件',
    sections: ch5Sections,
  ),
  ChapterEntity(
    title: '第六章：可滚动组件',
    sections: ch6Sections,
  ),
  ChapterEntity(
    title: '第七章：功能型组件',
    sections: ch7Sections,
  ),
];
