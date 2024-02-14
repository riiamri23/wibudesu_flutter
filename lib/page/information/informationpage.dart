import 'package:flutter/material.dart';
import 'package:wibudesu2/components/generals/wdgridvieweps.dart';
import 'package:wibudesu2/components/generals/wdlabelinfo.dart';
import 'package:wibudesu2/components/wdlisting/wdcardheader.dart';
import 'package:wibudesu2/models/animeinformation.dart';
import 'package:wibudesu2/repositories/csanime.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key, this.args}) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  final args;
  @override
  State<InformationPage> createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage> {
  // ignore: avoid_init_to_null
  late AnimeInformation? _animeInformation = null;

  @override
  void initState() {
    // print(widget.args['id']);
    super.initState();
    _getAnimeInformationById();
  }

  void _getAnimeInformationById() async {
    await CSAnimeService().getInformationById(widget.args['id']).then((value) {
      _animeInformation = value;

      setState(() {});
    });
  }

  Widget buildInformation(context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // WDAppBarLayout(),
          const SizedBox(
            height: 10,
          ),
          Text(
            _animeInformation?.title ?? "",
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              WDLabelInfo(
                  labelName: "Released ${_animeInformation?.releaseDate}"),
              WDLabelInfo(
                  labelName: _animeInformation?.status ?? '',
                  bgColor: Colors.green)
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.network(
                _animeInformation?.image ?? '',
                fit: BoxFit.fitWidth,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Flexible(
                child: Text(
                  _animeInformation?.otherName ?? '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const Spacer(),
              Text(
                "${_animeInformation?.totalEpisodes} Eps",
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Description",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _animeInformation?.description ?? '',
                // style: TextStyle(fontSize: 18),
              ),
              Text(
                _animeInformation?.type ?? '',
                // style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Wrap(
            direction: Axis.horizontal,
            runSpacing: 5,
            children:
                List.generate(_animeInformation?.genres?.length ?? 0, (index) {
              return WDLabelInfo(
                  labelName: _animeInformation?.genres?[index] ?? '',
                  bgColor: Colors.purple);
            }),
          ),
          const WDCardHeader(menuName: "Episode List"),
          WDGridviewEps(
            eps: _animeInformation?.episodes,
            orderList: "Descending",
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Object? args = ModalRoute.of(context)!.settings.arguments;
    // print(args);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: _animeInformation == null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : buildInformation(context)),
        ),
      ),
    );
  }
}
