import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class WDCourousel extends StatefulWidget {
  const WDCourousel({super.key, this.dataSource});

  // ignore: prefer_typing_uninitialized_variables
  final dataSource;

  @override
  State<StatefulWidget> createState() {
    return _WDCourouselImage();
  }
}

class _WDCourouselImage extends State<WDCourousel> {
  @override
  void initState() {
    if (widget.dataSource.length > 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        for (var imageUrl in widget.dataSource?.image) {
          precacheImage(NetworkImage(imageUrl), context);
        }
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.dataSource == null || widget.dataSource.length < 1
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : CarouselSlider.builder(
            itemCount: widget.dataSource.length,
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2.0,
              enlargeCenterPage: true,
            ),
            itemBuilder: (context, index, realIdx) {
              // print(widget.dataSource.toString());
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, '/information');
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => DetailScreen()));
                },
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      widget.dataSource[index]?.image,
                      fit: BoxFit.fitWidth,
                      width: 1000,
                      height: 500,
                    ),
                  ),
                ),
              );
            },
          );
  }
}
