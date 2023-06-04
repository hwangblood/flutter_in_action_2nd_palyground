import 'package:flutter/material.dart';

import 'constants.dart';

import 'package:flutter_in_action_2nd_materials/core/pages/pages.dart'
    show MainPage;

const appName = '《Flutter实战·第二版》示例';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: appName,
      theme: ThemeData(
        //蓝色主题
        primarySwatch: Colors.blue,
      ),
      //应用首页路由
      home: MainPage(
        title: appName,
        chapters: allChapters,
      ),
    );
  }
}
