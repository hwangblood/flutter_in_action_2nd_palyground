import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/shared/shared.dart';

class Se5FittedBox extends StatelessWidget {
  const Se5FittedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch5_container_widgets/se5_fitted_box.dart',
      appBar: AppBar(
        title: const Text('空间适配（FittedBox）'),
      ),
      children: [
        const Text('子组件大小超出了父组件大小时，如果不经过处理的话 Flutter 中就会显示一个溢出警告并在控制台打印错误日志'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30.0),
          child: Row(children: [Text(' xx ' * 30)]), //文本长度超出 Row 的最大宽度会溢出
        ),
        const DividerPadding(),
        const Text('没有指定任何适配方式，FittedBox 的子组件会溢出，但 FittedBox 仍然受其父组件约束'),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyContainer(boxFit: BoxFit.none),
            Text('hwangblood'),
          ],
        ),
        const DividerPadding(),
        const Text('指定适配方式为 BoxFit.contain'),
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            MyContainer(boxFit: BoxFit.contain),
            Text('Flutter中国'),
          ],
        ),
        const DividerPadding(),
        const Text('使用 ClipRect 将溢出部分裁剪掉'),
        const UnconstrainedBox(
          child: ClipRect(
            child: MyContainer(
              boxFit: BoxFit.none,
            ),
          ),
        ),
        const DividerPadding(),
        const Text('实例：单行缩放布局（在一行中显示 3个数字指标，当指标过长时将溢出屏幕）'),
        Column(
          children: [
            const MyTextRow(text: ' 90000000000000000123 '),
            const FittedBox(child: MyTextRow(text: ' 90000000000000000123 ')),
            LayoutLogPrint(
              tag: 1,
              child: const MyTextRow(text: ' 800 '),
            ),
            FittedBox(
              child: LayoutLogPrint(
                tag: 2,
                child: const MyTextRow(text: ' 800 '),
              ),
            ),
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: e,
                  ))
              .toList(),
        ),
        const DividerPadding(),
        const Text(
          '当指标不足以占满屏幕宽度时，FittedBox的子组件将采用最小宽度，因此三个 800指标都在屏幕中间\n'
          '要使指标占满屏幕宽度，更改 FittedBox子组件的约束即可',
        ),
        Column(
          children: [
            const MyTextRow(text: ' 90000000000000000123 '),
            const SingleLineFittedBox(
              child: MyTextRow(text: ' 90000000000000000123 '),
            ),
            LayoutLogPrint(
              tag: 1,
              child: const MyTextRow(text: ' 800 '),
            ),
            SingleLineFittedBox(
              child: LayoutLogPrint(
                tag: 2,
                child: const MyTextRow(text: ' 800 '),
              ),
            ),
          ]
              .map((e) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: e,
                  ))
              .toList(),
        ),
      ],
    );
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
              //让 maxWidth 使用屏幕宽度
              minWidth: constraints.maxWidth,
              maxWidth: double.infinity,
              //maxWidth: constraints.maxWidth,
            ),
            child: child,
          ),
        );
      },
    );
  }
}

/// 显示 3个数字指标，数字过长会 溢出布局
class MyTextRow extends StatelessWidget {
  final String text;

  const MyTextRow({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Text(text);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
  }
}

class MyContainer extends StatelessWidget {
  final BoxFit boxFit;
  const MyContainer({
    Key? key,
    this.boxFit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
      child: FittedBox(
        fit: boxFit,
        // 子容器超过父容器大小
        child: Container(
          width: 60,
          height: 70,
          color: Colors.blue,
        ),
      ),
    );
  }
}
