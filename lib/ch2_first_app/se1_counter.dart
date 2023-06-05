import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se1Counter extends StatefulWidget {
  const Se1Counter({
    Key? key,
  }) : super(key: key);

  @override
  State<Se1Counter> createState() => _Se1CounterState();
}

class _Se1CounterState extends State<Se1Counter> {
  int _counter = 0;

  void _increment() {
    // 更新状态
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithCodeView(
      filePath: 'lib/ch2_first_app/se1_counter.dart',
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
