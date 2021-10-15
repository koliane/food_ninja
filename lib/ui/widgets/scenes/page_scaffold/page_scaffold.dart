import 'package:flutter/material.dart';

class PageScaffold extends StatefulWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  final Function? init;
  final bool? resizeToAvoidBottomInset;

  const PageScaffold({
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.init,
    this.resizeToAvoidBottomInset,
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
      resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset
    );
  }
}