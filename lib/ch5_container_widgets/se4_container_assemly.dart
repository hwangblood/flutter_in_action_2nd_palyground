import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se4ContainerAssemly extends StatelessWidget {
  const Se4ContainerAssemly({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch5_container_widgets/se4_container_assemly.dart',
      appBar: AppBar(
        title: const Text('容器组件（Container）'),
      ),
      children: [
        const Text(
          'Container是一个组合类容器，它本身不对应具体的RenderObject\n'
          '它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等组件组合的一个多功能容器，',
        ),
        UnconstrainedBox(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50.0),
            constraints: const BoxConstraints.tightFor(
                width: 200.0, height: 150.0), //卡片大小
            decoration: const BoxDecoration(
              //背景装饰
              gradient: RadialGradient(
                //背景径向渐变
                colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98,
              ),
              boxShadow: [
                //卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0,
                )
              ],
            ),
            transform: Matrix4.rotationZ(.2), //卡片倾斜变换
            alignment: Alignment.center, //卡片内文字居中
            child: const Text(
              //卡片文字
              "5.20", style: TextStyle(color: Colors.white, fontSize: 40.0),
            ),
          ),
        ),
        const DividerPadding(),
        const Text('Container 的 padding 和 margin'),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(20.0), //容器外补白
                color: Colors.orange,
                child: const Text("Hello world!\nmargin 20"),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0), //容器内补白
                color: Colors.orange,
                child: const Text("Hello world!\npadding 20"),
              ),
            ),
          ],
        ),
        const DividerPadding(),
        const Text('效果同上, 使用 Padding 组件实现 padding 和 margin'),
        Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(color: Colors.orange),
                  child: Text("Hello world!"),
                ),
              ),
            ),
            Expanded(
              child: DecoratedBox(
                decoration: BoxDecoration(color: Colors.orange),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text("Hello world!"),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
