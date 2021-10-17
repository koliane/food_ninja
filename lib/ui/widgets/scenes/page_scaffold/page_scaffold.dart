import 'package:flutter/material.dart';
import 'package:food_ninja/ui/widgets/scenes/base_bottom_navigation_bar/base_bottom_navigation_bar.dart';

class PageScaffold extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Function? init;
  final bool? resizeToAvoidBottomInset;
  final bool showBottomAppBar;

  const PageScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.init,
    this.resizeToAvoidBottomInset,
    this.showBottomAppBar = false,
    Key? key
  }) : super(key: key);

  @override
  _PageScaffoldState createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {

  @override
  void initState() {
    super.initState();

    if(widget.init != null && widget.init is Function) {
      // ignore: avoid_dynamic_calls
      widget.init!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.body,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
      bottomNavigationBar: widget.showBottomAppBar ? BaseBottomNavigationBar() : null,
    );
  }
}