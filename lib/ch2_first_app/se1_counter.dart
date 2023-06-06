import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/shared/widgets/widgets.dart';

class Se1Counter extends StatelessWidget {
  const Se1Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldCodeView(
      filePath: 'lib/ch2_first_app/se1_counter.dart',
      appBar: AppBar(
        title: const Text('Counter Example'),
      ),
      child: const _CounterExample(),
    );
  }
}

class _CounterExample extends StatefulWidget {
  const _CounterExample({
    Key? key,
  }) : super(key: key);

  @override
  State<_CounterExample> createState() => __CounterExample();
}

class __CounterExample extends State<_CounterExample> {
  int _counter = 0;

  void _increment() {
    // 更新状态
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('You have pushed the button this many times:'),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        ElevatedButton(
          onPressed: _increment,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
