import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se1Constraints extends StatelessWidget {
  const Se1Constraints({
    Key? key,
  }) : super(key: key);

  final Widget redBox = const DecoratedBox(
    decoration: BoxDecoration(color: Colors.red),
  );

  Widget boxWithText(String text, {Color color = Colors.red}) => DecoratedBox(
        decoration: BoxDecoration(color: color),
        child: Text(text),
      );

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithCodeView(
      filePath: 'lib/ch4_layout_widgets/se1_constraints.dart',
      appBar: AppBar(
        title: const Text('布局原理与约束（constraints）'),
      ),
      body: ListView(
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minWidth: double.infinity, //宽度尽可能大
                minHeight: 50.0, //最小高度为50像素
              ),
              child: SizedBox(
                height: 5.0, // 低于父级约束,将不会生效
                child: boxWithText('ConstrainedBox\n宽度不限 h>=50'),
              ),
            ),
          ),
          const DividerPadding(),
          Column(
            children: [
              const Text('SizedBox'),
              SizedBox(
                width: 80.0,
                height: 80.0,
                child: boxWithText('SizedBox 宽80, 高80'),
              ),
              ConstrainedBox(
                constraints:
                    /* const BoxConstraints.tightFor(
              width: 80.0,
              height: 80.0,
            ), */
                    const BoxConstraints(
                  minHeight: 80.0,
                  maxHeight: 80.0,
                  minWidth: 240.0,
                  maxWidth: 240.0,
                ),
                child: boxWithText(
                  '宽240, 高80, 使用 ConstrainedBox 实现 w=240 h=80',
                  color: Colors.yellow,
                ),
              ),
            ],
          ),
          const DividerPadding(),
          UnconstrainedBox(
            child: ConstrainedBox(
              constraints: //父
                  const BoxConstraints(minWidth: 60.0, minHeight: 60.0),
              child: ConstrainedBox(
                constraints: //子
                    const BoxConstraints(minWidth: 90.0, minHeight: 20.0),
                child: boxWithText(
                  '多重限制, 取父子中相应数值较大的值\n (同时满足父子约束的值)\n'
                  '父 w>=60, h>=60; 子 w>=90, h>=20; 取 w>=90, h>=60',
                ),
              ),
            ),
          ),
          const DividerPadding(),
          ConstrainedBox(
            //父
            constraints: const BoxConstraints(
              minWidth: 60.0,
              minHeight: 100.0,
            ),
            child: UnconstrainedBox(
              //“去除”父级限制
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 240.0,
                  minHeight: 20.0,
                ), //子
                child:
                    boxWithText('UnconstrainedBox 去除父级约束,\n子约束 w<=240 h>=20'),
              ),
            ),
          ),
          const DividerPadding(),
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Loading受AppBar限制'),
            actions: const <Widget>[
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 3,
                  valueColor: AlwaysStoppedAnimation(Colors.white70),
                ),
              ),
            ],
          ),
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('用UnconstrainedBox解除限制后'),
            actions: const <Widget>[
              UnconstrainedBox(
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation(Colors.white70),
                  ),
                ),
              ),
            ],
          ),
          UnconstrainedBox(
            child: boxWithText(
              '实际上将 UnconstrainedBox 换成 Center 或者 Align 也可以，\n'
              '布局原理相关的章节中有详细解释',
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
