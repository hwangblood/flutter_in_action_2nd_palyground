import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show ExampleEntity;

class ExampleEntityTile extends StatelessWidget {
  final ExampleEntity entity;
  const ExampleEntityTile({
    super.key,
    required this.entity,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(entity.title),
      subtitle: Text(entity.description),
      trailing: const Icon(Icons.arrow_forward),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => entity.child,
          ),
        );
      },
    );
  }
}
