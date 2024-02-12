import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:wibudesu2/components/wdlisting/wdcardheader.dart';
// import 'package:wibudesu2/components/wdlayouts/wdappbar.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // WDAppBarLayout(),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Mob Psycho 100 II",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        // color: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: const BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Text(
                          "Released on 2022",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Text(
                          "Completed",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.network(
                        "https://gogocdn.net/cover/overlord-iv.png",
                        fit: BoxFit.fitWidth,
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    children: [
                      Text(
                        "オーバーロード IV",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Spacer(),
                      Text(
                        "13 Eps",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Fourth season of Overlord.",
                        // style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "SUMMER 2022 ANIME",
                        // style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Container(
                        // color: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Text(
                          "Action",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Text(
                          "Fantasy",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        // color: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 3),
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: const Text(
                          "Supernatural",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const WDCardHeader(menuName: "Episode List"),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 4),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    shrinkWrap: true,
                    // crossAxisCount: 4,
                    // childAspectRatio: 0.5,
                    controller: ScrollController(keepScrollOffset: false),
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      var descInd = 20 - index;
                      return Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: Text(
                          "$descInd",
                          style: const TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                    // children: List.generate(20, (index) {
                    //   return Container(
                    //     padding: const EdgeInsets.all(15),
                    //     decoration: const BoxDecoration(
                    //       color: Colors.grey,
                    //       borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    //     ),
                    //     child: Text("$index",
                    //         style: const TextStyle(color: Colors.white)),
                    //   );
                    // },),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
