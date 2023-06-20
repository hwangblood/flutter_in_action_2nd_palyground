import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/shared.dart';

class Se6Clipping extends StatelessWidget {
  const Se6Clipping({super.key});

  @override
  Widget build(BuildContext context) {
    // 头像
    final avatar = Image.asset("assets/images/avatar.jpeg", width: 80.0);

    return ScaffoldCodeListView(
      filePath: 'lib/ch5_container_widgets/se6_clipping.dart',
      appBar: AppBar(
        title: const Text('剪裁（Clip）'),
      ),
      children: [
        const Text('裁剪发生在绘制时，所以不会影响组件的大小，和Transform 原理相似'),
        const DividerPadding(),
        const Text('不剪裁'),
        UnconstrainedBox(
          child: avatar,
        ), //不剪裁
        const DividerPadding(),
        const Text('ClipOval 剪裁为圆形'),
        UnconstrainedBox(
          child: ClipOval(child: avatar),
        ), //剪裁为圆形
        const DividerPadding(),
        const Text('ClipRRect 剪裁为圆角矩形 BorderRadius.circular(5.0)'),
        UnconstrainedBox(
          child: ClipRRect(
            //剪裁为圆角矩形
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
        ),
        const DividerPadding(),
        const Text('头像宽度设为原来宽度一半，另一半会溢出（没有裁剪）'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
              child: avatar,
            ),
            const Text(
              "你好世界",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
        const DividerPadding(),
        const Text('ClipRect 将溢出部分剪裁（溢出部分为矩形）'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRect(
              //将溢出部分剪裁
              child: Align(
                alignment: Alignment.topLeft,
                widthFactor: .5, //宽度设为原来宽度一半
                child: avatar,
              ),
            ),
            const Text(
              "你好世界",
              style: TextStyle(color: Colors.green),
            ),
          ],
        ),
        const DividerPadding(),
        const Text('ClipRect 的自定义裁剪（CustomClipper<Rect>）'),
        UnconstrainedBox(
          child: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: ClipRect(
              clipper: MyClipper(), //使用自定义的clipper
              child: avatar,
            ),
          ),
        ),

        const DividerPadding(),
        const Text(
          'ClipPath 的自定义裁剪（CustomClipper<Path>）\n'
          '',
        ),

        UnconstrainedBox(
          child: ClipPath(
            clipper: CustomClipPath(),
            child: avatar,
            // Container(
            //   width: MediaQuery.of(context).size.width,
            //   height: 200,
            //   color: Colors.red,
            // ),
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(10.0, 15.0, 40.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0.0);
    path.close();

    // path: 0,0 -> width/2,height -> width,0
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
