import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/shared.dart';

class Se1SingleChildScrollView extends StatelessWidget {
  const Se1SingleChildScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    return ScaffoldCodeView(
      filePath: 'lib/ch6_scrollable_widgets/se1_single_child_scroll_view.dart',
      appBar: AppBar(
        title: const Text('SingleChildScrollView 示例'),
      ),
      child: Column(
        children: [
          const Text(
            'SingleChildScrollView 类似于 Android中的 ScrollView，只能接收一个子组件\n'
            'SingleChildScrollView 不支持基于 Sliver 的延迟加载模型\n'
            '当内容太多时，代价会非常昂贵（性能差）',
          ),
          Expanded(
            child: Scrollbar(
              // 显示进度条
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Column(
                    //动态创建一个List<Widget>
                    children: str.characters
                        //每一个字母都用一个Text显示,字体为原来的两倍
                        .map((c) => Text(
                              c,
                              textScaleFactor: 2.0,
                            ))
                        .toList(),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//
