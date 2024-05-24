import 'package:flutter/cupertino.dart';

class Expanded extends StatefulWidget {
  final Widget child;

  const Expanded({super.key, required this.child});

  @override
  State<Expanded> createState() => _ExpandedState();
}

class _ExpandedState extends State<Expanded> {
  @override
  Widget build(BuildContext context) {
    return Expanded(child: widget.child);
  }
}
