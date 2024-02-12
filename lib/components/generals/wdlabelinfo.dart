import 'package:flutter/material.dart';

class WDLabelInfo extends StatefulWidget {
  const WDLabelInfo({
    Key? key,
    required this.labelName,
    this.bgColor = Colors.blueAccent,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String labelName;
  final bgColor;
  final textColor;

  @override
  State<WDLabelInfo> createState() => _WDLabelInfoState();
}

class _WDLabelInfoState extends State<WDLabelInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueAccent,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      margin: const EdgeInsets.symmetric(horizontal: 2),
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
      ),
      child: Text(
        widget.labelName,
        style: TextStyle(
          color: widget.textColor,
        ),
      ),
    );
  }
}
