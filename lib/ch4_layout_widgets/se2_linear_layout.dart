import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se2LinearLayout extends StatelessWidget {
  const Se2LinearLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch4_layout_widgets/se2_linear_layout.dart',
      appBar: AppBar(
        title: const Text('线性布局（Row和Column）'),
      ),
      children: [
        const Text(
          '沿水平方向的布局，水平方向为主轴，垂直方向为纵轴\n'
          '沿垂直方向的布局，水平方向为纵轴，垂直方向为主轴\n'
          '枚举类MainAxisAlignment和CrossAxisAlignment, 可以指定主纵轴的对齐方式',
        ),
        const DividerPadding(),
        Column(
          //测试Row对齐方式，排除Column默认居中对齐的干扰
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            DefaultTextStyle(
              style: const TextStyle(color: Colors.blue),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Text(" 主轴: "),
                  Text(" 居中对齐 "),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Text(" 主轴占最小空间, "),
                Text(" 且居中对齐 "),
              ],
            ),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                textDirection: TextDirection.rtl,
                children: const <Widget>[
                  Text(" 主轴末端对齐 "),
                  Text(" 子组件从右往左, "),
                ],
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(color: Colors.red),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                verticalDirection: VerticalDirection.up,
                children: const <Widget>[
                  Text(
                    "纵轴底部对齐, ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text('(根据verticalDirection)纵轴从下往上'),
                ],
              ),
            ),
          ],
        ),
        const DividerPadding(),
        UnconstrainedBox(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 300,
            ),
            child: Container(
              color: Colors.pink.shade200,
              child: Column(
                // mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Text("Column 纵向布局, 纵轴底部对齐"),
                  Text("默认占最大宽度,  可以通过指定 mainAxisSize 参数 或 父级约束 来限制宽度"),
                  Text("这里使用 ConstrainedBox 宽度最大不超过300"),
                ],
              ),
            ),
          ),
        ),
        const DividerPadding(),
        Container(
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisSize: MainAxisSize.min, //有效，外层Column高度为500
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max, //无效，内层Column为实际宽度

                        children: const <Widget>[
                          Text("外层Column高度为500, 主轴分散对齐"),
                          Text("内层Column为实际内容高度,(即使指定了 MainAxisSize.max)"),
                          Text("Expanded使内层Column占满高度"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
