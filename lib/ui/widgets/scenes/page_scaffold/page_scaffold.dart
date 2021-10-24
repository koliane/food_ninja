import 'package:flutter/material.dart';
import 'package:food_ninja/ui/service/app/app_global_keys.dart';
import 'package:food_ninja/ui/widgets/scenes/base_bottom_navigation_bar/base_bottom_navigation_bar.dart';

class PageScaffold extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final VoidCallback? init;
  final VoidCallback? dispose;
  final bool? resizeToAvoidBottomInset;
  final bool showBottomAppBar;
  final Widget? bottomNavigationBar;

  const PageScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.init,
    this.dispose,
    this.resizeToAvoidBottomInset,
    this.showBottomAppBar = false,
    this.bottomNavigationBar,
    Key? key
  }) : super(key: key);

  @override
  _PageScaffoldState createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  GlobalKey<ScaffoldState>? scaffoldKey;

  @override
  void initState() {
    super.initState();
    final func = widget.init;
    if(func != null) {
      func();
    }
    scaffoldKey = AppGlobalKeys.initCurrentPageKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: widget.body,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      bottomNavigationBar: widget.bottomNavigationBar ?? (widget.showBottomAppBar ? BaseBottomNavigationBar() : null),
    );
  }

  @override
  void dispose() {
    final func = widget.dispose;
    if(func != null) {
      func();
    }
    super.dispose();
  }
}