import 'package:flutter/material.dart';
import 'package:flutter_in_action_2nd_materials/shared/shared.dart';

class Se7PageSkeleton extends StatefulWidget {
  const Se7PageSkeleton({super.key});

  @override
  State<Se7PageSkeleton> createState() => _Se7PageSkeletonState();
}

enum BottomBarType { bottomBavBar, bottomAppBar }

class _Se7PageSkeletonState extends State<Se7PageSkeleton> {
  final pages = const [
    Center(
      child: Text('Home'),
    ),
    Center(
      child: Text('Business'),
    ),
    Center(
      child: Text('School'),
    ),
  ];

  /// TODO: Can't switch [BottomBarType] to apply defferent values
  BottomBarType? _bottomBavType = BottomBarType.bottomBavBar;

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _changeBottomBarType(BottomBarType? type) {
    setState(() {
      _bottomBavType = type;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeListView(
      filePath: 'lib/ch5_container_widgets/se7_page_skeleton.dart',
      appBar: AppBar(
        title: const Text('页面骨架（Scaffold）'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: const Icon(Icons.dashboard, color: Colors.white), //自定义图标
              onPressed: () {
                // 打开抽屉菜单
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      drawer: const MyDrawer(),
      floatingActionButton: _bottomBavType == BottomBarType.bottomAppBar
          ? FloatingActionButton(
              onPressed: () {},
              child: const Icon(Icons.add),
            )
          : null,
      floatingActionButtonLocation: _bottomBavType == BottomBarType.bottomAppBar
          ? FloatingActionButtonLocation.centerDocked
          : null,
      bottomNavigationBar: _bottomBavType == BottomBarType.bottomBavBar
          ? BottomNavigationBar(
              // 底部导航
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.business),
                  label: 'Business',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.school),
                  label: 'School',
                ),
              ],
              currentIndex: _selectedIndex,
              fixedColor: Colors.blue,
              onTap: _onItemTapped,
            )
          : BottomAppBar(
              color: Colors.white,
              shape: const CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    icon: const Icon(Icons.home),
                    onPressed: () {},
                  ),
                  const SizedBox(), //中间位置空出
                  IconButton(
                    icon: const Icon(Icons.business),
                    onPressed: () {},
                  ),
                ], //均分底部导航栏横向空间
              ),
            ),
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Tap to Back'),
          ),
        ),
        _bottomBavType == BottomBarType.bottomBavBar
            ? pages[_selectedIndex]
            : const Text('body'),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RadioListTile(
              title: const Text('Bottom Navigation Bar'),
              value: BottomBarType.bottomBavBar,
              groupValue: _bottomBavType,
              onChanged: (type) {
                setState(() {
                  _bottomBavType = type!;
                });
              },
            ),
            RadioListTile(
              title: const Text('Bottom App Bar'),
              value: BottomBarType.bottomAppBar,
              groupValue: _bottomBavType,
              onChanged: (type) {
                _changeBottomBarType(type);
              },
            ),
          ],
        )
      ],
    );
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.jpeg",
                        width: 80,
                      ),
                    ),
                  ),
                  const Text(
                    "hwangblood",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: const <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
