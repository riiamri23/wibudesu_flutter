import 'package:flutter/material.dart';

class WDEps extends StatefulWidget {
  const WDEps({Key? key, required this.eps}) : super(key: key);

  final eps;
  @override
  State<WDEps> createState() => _WDEpsState();
}

class _WDEpsState extends State<WDEps> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/watch',
          arguments: {'id': widget.eps?.id},
        );
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => DetailScreen()));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Text(
          widget.eps.number.toString(),
          style: const TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
