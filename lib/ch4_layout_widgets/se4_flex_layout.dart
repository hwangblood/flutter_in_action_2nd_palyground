import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se4FlexLayout extends StatelessWidget {
  const Se4FlexLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch4_layout_widgets/se4_flex_layout.dart',
      appBar: AppBar(
        title: const Text('弹性布局（Flex）'),
      ),
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Flutter 中的弹性布局主要通过Flex和Expanded来配合实现。'),
        ),
        const DividerPadding(),
        const Text('Flex的两个子widget按1：2来占据水平空间'),
        Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                height: 30.0,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30.0,
                color: Colors.green,
              ),
            ),
          ],
        ),
        const DividerPadding(),
        const Text('Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间'),
        SizedBox(
          height: 100.0,
          child: Flex(
            direction: Axis.vertical,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
