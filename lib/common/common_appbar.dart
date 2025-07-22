import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget {
  final String headerTitle;
  final Widget? body;


  const DefaultAppBar({
    Key? key,
    required this.headerTitle,
    this.body,
  }) : super(key: key);

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    centerTitle: true,
    backgroundColor: Colors.blue,
    title: Text(widget.headerTitle , style: TextStyle(color: Colors.white),),
    ),
    body: widget.body

    );
  }
}