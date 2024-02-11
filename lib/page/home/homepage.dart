import 'package:flutter/material.dart';

import 'package:wibudesu2/components/wdlayouts/wdappbar.dart';
import 'package:wibudesu2/components/wdlayouts/wdcourosel.dart';
import 'package:wibudesu2/components/wdlisting/wdlisting.dart';
import 'package:wibudesu2/models/topairing.dart';
import 'package:wibudesu2/repositories/csanime.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: avoid_init_to_null
  late TopAiringModel? _topAiringModel = null;
  late List<TopAiringListModel?> _topAiringListModel = [];

  @override
  void initState() {
    super.initState();
    _getTopAiring();
  }

  void _getTopAiring() async {
    // _topAiringModel = (await CSAnimeService().getTopAiring());

    // Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
    await CSAnimeService().getTopAiring().then((value) {
      _topAiringModel = value;
      _topAiringListModel = _topAiringModel!.results!;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            // decoration: const BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [Color(0xFF53396c), Color(0xFF2b1f37)])),
            child: Column(
              children: [
                const WDAppBarLayout(),
                Column(children: [
                  WDCourousel(
                    dataSource: _topAiringListModel,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  WDListingCard(
                    menuName: "Recent History",
                    dataSource: _topAiringListModel,
                  ),
                  WDListingCard(
                    menuName: "Latest Episodes",
                    isHorizontal: false,
                    dataSource: _topAiringListModel,
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
