import 'package:flutter/material.dart';

import 'package:widget_with_codeview/widget_with_codeview.dart';

import 'package:flutter_in_action_2nd_materials/core/constants/constants.dart';

class ScaffoldWithCodeView extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final String filePath;
  final String? codeLinkPrefix;
  final Widget body;
  final Widget? floatingActionButton;

  const ScaffoldWithCodeView({
    Key? key,
    this.appBar,
    required this.filePath,
    this.codeLinkPrefix = GithubConstants.codeLinkPrefix,
    required this.body,
    this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: WidgetWithCodeView(
        filePath: filePath,

        /// [codeLinkPrefix] is optional. When it's specified, two more buttons
        /// (open-code-in-browser, copy-code-link) will be added in the code view.
        codeLinkPrefix: codeLinkPrefix,
        child: body,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
