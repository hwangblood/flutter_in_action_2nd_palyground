import 'package:flutter/material.dart';

import 'package:flutter_in_action_2nd_materials/core/models.dart'
    show SectionEntity;

class SectionEntityTile extends StatelessWidget {
  final SectionEntity entity;
  const SectionEntityTile({
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
