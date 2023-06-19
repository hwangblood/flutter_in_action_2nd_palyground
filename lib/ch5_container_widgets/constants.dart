import 'package:flutter_in_action_2nd_materials/ch5_container_widgets/se3_transformation.dart';
import 'package:flutter_in_action_2nd_materials/ch5_container_widgets/se4_container_assemly.dart';
import 'package:flutter_in_action_2nd_materials/ch5_container_widgets/se7_page_skeleton.dart';
import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show SectionEntity;

final ch5Sections = <SectionEntity>[
  SectionEntity(
    title: '5.3 变换（Transform）',
    description: '变换（Transform）',
    child: const Se3Transformation(),
  ),
  SectionEntity(
    title: '5.4 容器组件（Container）',
    description: '容器组件（Container）',
    child: const Se4ContainerAssemly(),
  ),
  SectionEntity(
    title: '5.7 页面骨架（Scaffold）',
    description: '页面骨架（Scaffold）',
    child: const Se7PageSkeleton(),
  ),
];
