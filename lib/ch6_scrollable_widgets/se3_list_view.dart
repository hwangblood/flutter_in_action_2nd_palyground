import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter_in_action_2nd_materials/shared/shared.dart';

class Se3ListView extends StatelessWidget {
  const Se3ListView({super.key});

  @override
  Widget build(BuildContext context) {
    //下划线widget预定义以供复用。
    Widget divider1 = const Divider(color: Colors.blue, thickness: 2);
    Widget divider2 = const Divider(color: Colors.green);

    return ScaffoldCodeListView(
      filePath: 'lib/ch6_scrollable_widgets/se3_list_view.dart',
      appBar: AppBar(
        title: const Text('ListView 示例'),
      ),
      children: [
        const Text(
          'ListView是最常用的可滚动组件之一，它可以沿一个方向线性排布所有子组件，并且它也支持列表项懒加载（在需要时才会创建列表项）',
        ),
        const DividerPadding(),
        const Text('默认构造函数 ListView()'),
        Container(
          color: Colors.pink.shade100,
          height: 50,
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            children: const <Widget>[
              Text('I\'m dedicating every day to you'),
              Text('Domestic life was never quite my style'),
              Text('When you smile, you knock me out, I fall apart'),
              Text('And I thought I was so smart'),
            ],
          ),
        ),
        const DividerPadding(),
        const Text('ListView.builder 适合列表项比较多或者不确定的情况'),
        Container(
          color: Colors.pink.shade100,
          height: 100,
          child: ListView.builder(
            itemCount: 10, // 为null，则为无限列表
            itemExtent: 50.0, //强制 item高度为50.0
            itemBuilder: (BuildContext context, int index) => ListTile(
              title: Text("#$index"),
            ),
          ),
        ),
        const DividerPadding(),
        const Text('ListView.separated 可以在生成的列表项之间添加一个分割组件'),
        Container(
          color: Colors.pink.shade100,
          height: 100,
          child: ListView.separated(
            itemCount: 10,
            //列表项构造器
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text("$index"));
            },
            //分割器构造器
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? divider1 : divider2;
            },
          ),
        ),
        const DividerPadding(),
        const Text('当知晓列表项的高度都相同时，强烈建议指定 itemExtent 或 prototypeItem，会有更高的性能'),
        Container(
          color: Colors.pink.shade100,
          height: 100,
          child: ListView.builder(
            itemCount: 20,
            // itemExtent: 56,
            prototypeItem: const ListTile(title: Text("1")),
            itemBuilder: (context, index) {
              return LayoutLogPrint(
                tag: index,
                child: ListTile(title: Text("$index")),
              );
            },
          ),
        ),
        const DividerPadding(),
        const Text('实例：无限加载列表，（最多加载 100个列表项）'),
        Container(
          color: Colors.pink.shade100,
          height: 100,
          child: const InfiniteListView(),
        ),
        const DividerPadding(),
        const Text('实例：添加固定列表头'),
        Container(
          color: Colors.pink.shade100,
          height: 200,
          child: Column(
            children: [
              const ListTile(title: Text("商品列表")),
              Expanded(
                // 也可以使用 SizedBox计算高度，但不方便 因为随时根据布局来重新计算，Flex最方便
                //Material设计规范中状态栏、导航栏、ListTile高度分别为24、56、56
                // height: MediaQuery.of(context).size.height-24-56-56,
                child: ListView.builder(
                  itemCount: 20,
                  // itemExtent: 56,
                  prototypeItem: const ListTile(title: Text("1")),
                  itemBuilder: (context, index) {
                    return LayoutLogPrint(
                      tag: index,
                      child: ListTile(title: Text("$index")),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        const DividerPadding(),
        const Text(
          '还有 ListView.custom方法，它需要实现一个SliverChildDelegate 用来给 '
          'ListView 生成列表项组件，更多详情请参考 API 文档',
        ),
      ],
    );
  }
}

class InfiniteListView extends StatefulWidget {
  const InfiniteListView({super.key});

  @override
  State<InfiniteListView> createState() => _InfiniteListViewState();
}

class _InfiniteListViewState extends State<InfiniteListView> {
  static const endingTag = "##footer##"; //表尾标记
  final _words = <String>[endingTag];

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: _words.length,
      itemBuilder: (context, index) {
        //如果到了表尾
        if (_words[index] == endingTag) {
          //不足100条，继续获取数据
          if (_words.length - 1 < 100) {
            //获取数据
            _retrieveData();
            //加载时显示loading, 当加载完成时 _words 长度增加，即加载列表项
            return Container(
              padding: const EdgeInsets.all(16.0),
              alignment: Alignment.center,
              child: const SizedBox(
                width: 24.0,
                height: 24.0,
                child: CircularProgressIndicator(strokeWidth: 2.0),
              ),
            );
          } else {
            // 已经加载了100条数据，不再获取数据。
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                "没有更多了",
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
        }
        //显示单词列表项
        return ListTile(title: Text('#$index ${_words[index]}'));
      },
      separatorBuilder: (context, index) => const Divider(height: .0),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }
}
