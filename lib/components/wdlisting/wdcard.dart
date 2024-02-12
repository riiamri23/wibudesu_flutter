import 'package:flutter/material.dart';

class WDCard extends StatefulWidget {
  const WDCard({super.key, this.data});

  final data;

  @override
  State<WDCard> createState() => _WDCardState();
}

class _WDCardState extends State<WDCard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              widget.data?.image,
              fit: BoxFit.fitWidth,
              width: 120,
              height: 120,
            ),
          ),
          Text(
            widget.data?.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            maxLines: 2,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
