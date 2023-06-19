import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se6StackedLayout extends StatelessWidget {
  const Se6StackedLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch4_layout_widgets/se6_stacked_layout.dart',
      appBar: AppBar(
        title: const Text('层叠布局（Stack、Positioned）'),
      ),
      children: [
        const Text(
          'Flutter中使用Stack和Positioned这两个组件来配合实现绝对定位。Stack允许子组件堆叠，'
          '而Positioned用于根据Stack的四个角来确定子组件的位置。',
        ),
        const DividerPadding(),
        const Text('Stack 示例 StackFit.loose'),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 200,
            minHeight: 200,
          ),
          child: Container(
            color: Colors.yellowAccent,
            child: Stack(
              alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
              children: <Widget>[
                Container(
                  color: Colors.red,
                  child: const Text(
                    "Hello world\ndefault position",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Positioned(
                  left: 18.0,
                  child: Text("I am Jack\nleft: 18.0"),
                ),
                const Positioned(
                  top: 18.0,
                  child: Text("Your friend\ntop: 18.0"),
                ),
              ],
            ),
          ),
        ),
        const DividerPadding(),
        const Text(
          'Stack 示例 StackFit.expand\n'
          '第二个子文本组件没有定位，所以 fit 属性会对它起作用，就会占满 Stack。\n'
          '由于 Stack 子元素是堆叠的，所以第一个子文本组件被第二个遮住了',
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 200,
            minHeight: 200,
          ),
          child: Container(
            color: Colors.yellowAccent,
            child: Stack(
              alignment: Alignment.center,
              fit: StackFit.expand, //未定位widget占满Stack整个空间
              children: <Widget>[
                const Positioned(
                  left: 18.0,
                  child: Text("I am Jack\nleft: 18.0"),
                ),
                // Container 会占满 Stack 所以更底层的组件会被遮住
                Container(
                  color: Colors.red,
                  child: const Text(
                    "Hello world\ndefault position",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const Positioned(
                  top: 18.0,
                  child: Text("Your friend\ntop: 18.0"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
