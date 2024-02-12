import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WDCardHeader extends StatefulWidget {
  const WDCardHeader({Key? key, this.menuName}) : super(key: key);

  final menuName;
  @override
  State<WDCardHeader> createState() => _WDCardHeaderState();
}

class _WDCardHeaderState extends State<WDCardHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      // header
      children: [
        IconButton(
          icon: SvgPicture.asset(
            "assets/icons/menu-svgrepo-com.svg",
            width: 20,
            height: 20,
          ),
          onPressed: () {},
        ),
        Expanded(
          child: Text(
            widget.menuName,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
