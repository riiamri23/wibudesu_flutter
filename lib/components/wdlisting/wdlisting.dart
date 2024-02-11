import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wibudesu2/components/wdlisting/wdcard.dart';

class WDListingCard extends StatefulWidget {
  const WDListingCard({
    Key? key,
    required this.menuName,
    required this.dataSource,
    this.isHorizontal = true,
  }) : super(key: key);

  final String menuName;
  final dataSource;
  final bool isHorizontal;

  @override
  State<WDListingCard> createState() => _WDListingCardState();
}

class _WDListingCardState extends State<WDListingCard> {
  @override
  Widget build(BuildContext context) {
    return widget.dataSource == null || widget.dataSource?.length < 1
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
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
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              widget.isHorizontal
                  ? buildHorizontalList(context, widget.dataSource)
                  : buildVerticalList(context, widget.dataSource),
            ],
          );
  }
}

Container buildHorizontalList(context, dataSource) {
  return Container(
    height: 200,
    margin: const EdgeInsets.only(left: 10),
    child: ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(
        width: 5,
      ),
      itemCount: dataSource?.length,
      itemBuilder: (context, index) => WDCard(
        data: dataSource[index],
      ),
    ),
  );
}

Widget buildVerticalList(context, dataSource) {
  double cardWidth = MediaQuery.of(context).size.width / 3.3;
  double cardHeight = MediaQuery.of(context).size.height / 5;

  return GridView.count(
    shrinkWrap: true,
    crossAxisCount: 3,
    childAspectRatio: cardWidth / cardHeight,
    controller: ScrollController(keepScrollOffset: false),
    children: List.generate(dataSource.length, (index) {
      return WDCard(
        data: dataSource[index],
      );
    }),
  );
}
