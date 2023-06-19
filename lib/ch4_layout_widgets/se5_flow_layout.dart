import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se5FlowLayout extends StatelessWidget {
  const Se5FlowLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch4_layout_widgets/se5_flow_layout.dart',
      appBar: AppBar(
        title: const Text('流式布局（Wrap、Flow）'),
      ),
      children: [
        const Text('在使用 Row 和 Colum 时，如果子 widget 超出屏幕范围，则会报溢出错误'),
        Row(
          children: <Widget>[Text("xxx" * 100)],
        ),
        const DividerPadding(),
        const Text(
          'Wrap spacing：主轴方向子widget的间距; runSpacing：纵轴方向的间距; '
          'runAlignment：纵轴方向的对齐方式',
        ),
        Wrap(
          spacing: 8.0, // 主轴(水平)方向间距
          // runSpacing: 2.0, // 纵轴（垂直）方向间距
          alignment: WrapAlignment.center, //沿主轴方向居中
          children: const <Widget>[
            Chip(
              avatar:
                  CircleAvatar(backgroundColor: Colors.blue, child: Text('A')),
              label: Text('Hamilton'),
            ),
            Chip(
              avatar:
                  CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
              label: Text('Lafayette'),
            ),
            Chip(
              avatar:
                  CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
              label: Text('Mulligan'),
            ),
            Chip(
              avatar:
                  CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: Text('Laurens'),
            ),
            Chip(
              avatar:
                  CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
              label: Text('Chrismas'),
            ),
          ],
        ),
        const DividerPadding(),
        const Text(
          '一般很少会使用Flow，因为其过于复杂，需要自己实现子 widget 的位置转换，在很多'
          '场景下首先要考虑的是Wrap是否满足需求。详细信息参考书中讲解或API文档',
        ),
      ],
    );
  }
}
