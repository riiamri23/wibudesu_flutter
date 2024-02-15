import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:wibudesu2/models/animewatch.dart';
import 'package:wibudesu2/repositories/csanime.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key, this.args}) : super(key: key);

  final args;

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  late WebViewController? controller = null;
  late AnimeWatch? _animeWatch = null;

  @override
  void initState() {
    super.initState();
    _getWatchById();
  }

  void _getWatchById() async {
    // print(_controller);
    await CSAnimeService().getWatchById(widget.args['id']).then((value) {
      _animeWatch = value;
      if (_animeWatch?.headers?.referer != '') {
        print(_animeWatch);
        String path = _animeWatch?.headers?.referer ?? '';

        controller = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setBackgroundColor(const Color(0x00000000))
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {
                // Update loading bar.
                print(progress);
              },
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onWebResourceError: (WebResourceError error) {
                print(error.toString());
              },
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          // ..loadRequest(Uri.parse('https://flutter.dev'));
          ..loadRequest(Uri.parse(path));
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _animeWatch == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: WebViewWidget(controller: controller!),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
