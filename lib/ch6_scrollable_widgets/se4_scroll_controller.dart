import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/shared.dart';

class Se4ScrollController extends StatefulWidget {
  const Se4ScrollController({super.key});

  @override
  State<Se4ScrollController> createState() => _Se4ScrollControllerState();
}

class _Se4ScrollControllerState extends State<Se4ScrollController> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch6_scrollable_widgets/se4_scroll_controller.dart',
      appBar: AppBar(
        title: const Text('滚动监听及控制'),
      ),
      children: [
        const Text(
          'ScrollController 示例：滑动到 500显示返回顶部按钮\n'
          'ScrollController 只能和具体的可滚动组件关联后才可以监听\n'
          'ScrollController 只能获取当前滚动位置',
        ),
        Container(
          height: 150,
          color: Colors.pink.shade100,
          child: const ScrollControllerTestRoute(),
        ),
        const DividerPadding(),
        const Text(
          '滚动监听 - 使用 NotificationListener 接收 ScrollNotification\n'
          '可以在可滚动组件到widget树根之间任意位置监听\n'
          '在收到滚动事件时，通知的 metrics 属性会携带当前滚动位置和 ViewPort的一些信息',
        ),
        Container(
          height: 150,
          color: Colors.pink.shade100,
          child: const ScrollNotificationTestRoute(),
        ),
      ],
    );
  }
}

class ScrollControllerTestRoute extends StatefulWidget {
  const ScrollControllerTestRoute({super.key});

  @override
  State<ScrollControllerTestRoute> createState() {
    return ScrollControllerTestRouteState();
  }
}

class ScrollControllerTestRouteState extends State<ScrollControllerTestRoute> {
  final ScrollController _controller = ScrollController();
  bool showToTopBtn = false; //是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      print('当前滑动的位置：${_controller.offset}');
      if (_controller.offset < 500 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 500 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Scrollbar(
          child: ListView.builder(
              itemCount: 50,
              itemExtent: 50.0, //列表项高度固定时，显式指定高度是一个好习惯(性能消耗小)
              controller: _controller,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("$index"),
                );
              }),
        ),
        if (showToTopBtn)
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FloatingActionButton(
              // backgroundColor: Colors.amber,
              child: const Icon(Icons.arrow_upward),
              onPressed: () {
                //返回到顶部时执行动画，jumpTo 无动画
                _controller.animateTo(
                  .0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.ease,
                );
              },
            ),
          ),
      ],
    );
  }
}

class ScrollNotificationTestRoute extends StatefulWidget {
  const ScrollNotificationTestRoute({super.key});

  @override
  State<ScrollNotificationTestRoute> createState() =>
      _ScrollNotificationTestRouteState();
}

class _ScrollNotificationTestRouteState
    extends State<ScrollNotificationTestRoute> {
  String _progress = "0%"; //保存进度百分比
  bool _scrollToEnd = false;

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //进度条
      // 监听滚动通知
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          double progress = notification.metrics.pixels /
              notification.metrics.maxScrollExtent;
          //重新构建
          setState(() {
            _progress = "${(progress * 100).toInt()}%";
            if (notification.metrics.extentAfter == 0) {
              _scrollToEnd = true;
            } else {
              _scrollToEnd = false;
            }
          });
          return false;
          //return true; //放开此行注释后，进度条将失效
        },
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            ListView.builder(
              itemCount: 50,
              itemExtent: 50.0,
              itemBuilder: (context, index) => ListTile(title: Text("$index")),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  //显示进度百分比
                  radius: 30.0,
                  backgroundColor: Colors.black54,
                  child: Text(_progress),
                ),
                Text(_scrollToEnd ? 'end' : 'not end'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
