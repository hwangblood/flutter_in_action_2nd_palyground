import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/shared.dart';
import 'dart:math' as math;

class Se3Transformation extends StatelessWidget {
  const Se3Transformation({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch5_container_widgets/se3_transformation.dart',
      appBar: AppBar(
        title: const Text('变换（Transform）'),
      ),
      children: [
        const Text(
          'Transform可以对子组件应用一些矩阵变换来实现一些特效\n'
          '矩阵变换的相关内容属于线性代数范畴\n'
          '注意: 变换的结果不会影响父组件, 因为变换发生在 *绘制时*\n'
          '组件渲染顺序: 先布局 -> 再绘制',
        ),
        const DividerPadding(),
        const Text('Transform 示例: 以右上角为原点，沿 Y 轴倾斜 0.5 弧度'),
        UnconstrainedBox(
          child: Container(
            alignment: Alignment.bottomRight,
            color: Colors.black,
            height: 100,
            width: 100,
            child: Transform(
              alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
              transform: Matrix4.skewY(0.5), //沿Y轴倾斜0.5弧度
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.deepOrange,
                child: const Text('Apartment for rent!'),
              ),
            ),
          ),
        ),
        const DividerPadding(),
        const Text('平移 Transform.translate 默认原点为左上角，左移20像素，向上平移5像素'),
        UnconstrainedBox(
          child: SizedBox(
            width: 100,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              //默认原点为左上角，左移20像素，向上平移5像素
              child: Transform.translate(
                offset: const Offset(-20.0, -5.0),
                child: const Text("Hello world"),
              ),
            ),
          ),
        ),
        const DividerPadding(),
        const Text('旋转 Transform.rotate 可以对子组件进行旋转变换, 顺时针旋转 180度'),
        UnconstrainedBox(
          child: SizedBox(
            width: 100,
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.rotate(
                //顺时针旋转 180度
                angle: math.pi, // 180度
                child: const Text(
                  "Hello world",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
          ),
        ),
        const DividerPadding(),
        const Text(
          '缩放 Transform.scale可以对子组件进行缩小或放大\n' '如下: :将文本子组件放大 2.0 倍',
        ),
        UnconstrainedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 2.0, //放大到 2.0倍
                child: const Text("Hello world"),
              ),
            ),
          ),
        ),
        const DividerPadding(),
        const Text(
            'Transform 注意事项 \nTransform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: const Text("Hello world"),
              ),
            ),
            const Text(
              "你好",
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            ),
          ],
        ),
        const DividerPadding(),
        const Text(
          'RotatedBox 和Transform.rotate功能相似，都可以对子组件进行旋转变换\n'
          '但有一点不同：RotatedBox 的变换是在layout阶段, 即重新布局, 所以会影响父组件',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              //将Transform.rotate换成RotatedBox
              child: RotatedBox(
                quarterTurns: 1, //旋转90度(1/4圈)
                child: Text("Hello world 旋转90度"),
              ),
            ),
            Text(
              "你好",
              style: TextStyle(color: Colors.green, fontSize: 18.0),
            )
          ],
        ),
      ],
    );
  }
}
