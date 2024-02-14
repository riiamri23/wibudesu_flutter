import 'package:flutter/material.dart';

class WDEps extends StatefulWidget {
  const WDEps({Key? key, required this.text}) : super(key: key);

  final String text;
  @override
  State<WDEps> createState() => _WDEpsState();
}

class _WDEpsState extends State<WDEps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      child: Text(
        widget.text,
        style: const TextStyle(color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}
