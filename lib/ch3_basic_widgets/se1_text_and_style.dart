import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se1TextAndStyle extends StatelessWidget {
  const Se1TextAndStyle({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithCodeView(
      filePath: 'lib/ch3_basic_widgets/se1_text_and_style.dart',
      appBar: AppBar(
        title: const Text('文本及样式示例'),
      ),
      body: ListView(
        children: [
          const Text(
            "Hello world, textAlign: TextAlign.left",
            textAlign: TextAlign.left,
          ),
          Text(
            "Hello world, maxLines: 1, TextOverflow.ellipsis" * 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Text(
            "Hello world, textScaleFactor: 1.5",
            textScaleFactor: 1.5,
          ),
          const DividerPadding(),
          Text(
            'Hello world, TextStyle 用于指定文本显示的样式如颜色、字体、粗细、背景等',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 18.0,
              height: 1.2,
              fontFamily: "Courier",
              background: Paint()..color = Colors.yellow,
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.dashed,
            ),
          ),
          const DividerPadding(),
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: "TextSpan: "),
                TextSpan(
                  text: "https://flutterchina.club",
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('点击了链接'),
                        ),
                      );
                    },
                ),
              ],
            ),
          ),
          const DividerPadding(),
          DefaultTextStyle(
            //1.设置文本默认样式
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("DefaultTextStyle 用于设置默认文本样式"),
                Text("I am Jack"),
                Text(
                  "I am Jack, inherit: false 不继承样式",
                  style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
          const DividerPadding(),
          const Text(
            "Applying the Raleway font for this text",
            style: TextStyle(
              fontFamily: 'Raleway',
            ),
          ),
          const Text(
            "Applying the AbrilFatface-Regular font for this text",
            style: TextStyle(
              fontFamily: 'AbrilFatface',
            ),
          ),
        ],
      ),
    );
  }
}
