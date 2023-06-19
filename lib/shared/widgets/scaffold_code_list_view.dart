import 'package:flutter/material.dart';
import 'package:widget_with_codeview/widget_with_codeview.dart';

import 'package:flutter_in_action_2nd_materials/core/constants/constants.dart';

class ScaffoldCodeListView extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final String filePath;
  final String? codeLinkPrefix;
  final List<Widget> children;
  final double? itemExtent;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Widget? bottomNavigationBar;

  final scrollController = ScrollController();

  ScaffoldCodeListView({
    Key? key,
    this.appBar,
    required this.filePath,
    this.codeLinkPrefix = GithubConstants.codeLinkPrefix,
    required this.children,
    this.itemExtent,
    this.drawer,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: WidgetWithCodeView(
        filePath: filePath,
        // [codeLinkPrefix] is optional. When it's specified, two more buttons
        // (open-code-in-browser, copy-code-link) will be added in the code view.
        codeLinkPrefix: codeLinkPrefix,
        child: Scrollbar(
          // thumbVisibility: true,
          // thickness: 10,
          // controller: scrollController, // Here
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            // controller: scrollController, // AND Here
            itemCount: children.length,
            itemBuilder: (context, index) => children.elementAt(index),
            itemExtent: itemExtent,
          ),
        ),
      ),
      drawer: drawer,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: floatingActionButtonLocation,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
