import 'package:flutter/material.dart';

class DividerPadding extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final Divider? divider;
  const DividerPadding({
    Key? key,
    this.padding = const EdgeInsets.all(8.0),
    this.divider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: divider ??
          Divider(
            color: Theme.of(context).dividerColor.withAlpha(125),
          ),
    );
  }
}
