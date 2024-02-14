import 'package:flutter/widgets.dart';
import 'package:wibudesu2/components/generals/wdeps.dart';

class WDGridviewEps extends StatefulWidget {
  const WDGridviewEps({Key? key, this.eps, this.orderList = "Ascending"})
      : super(key: key);

  // ignore: prefer_typing_uninitialized_variables
  final eps;
  final String orderList;
  @override
  State<WDGridviewEps> createState() => _WDGridviewEpsState();
}

class _WDGridviewEpsState extends State<WDGridviewEps> {
  @override
  Widget build(BuildContext context) {
    var epsList = widget.orderList == "Descending"
        ? widget.eps.reversed.toList()
        : widget.eps;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 4),
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      shrinkWrap: true,
      controller: ScrollController(keepScrollOffset: false),
      itemCount: epsList?.length,
      itemBuilder: (context, index) {
        // var descInd = epsList?[index].number;
        return WDEps(eps: epsList?[index]);
      },
    );
  }
}
