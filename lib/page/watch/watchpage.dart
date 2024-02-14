import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:wibudesu2/models/animewatch.dart';
import 'package:wibudesu2/repositories/csanime.dart';

class WatchPage extends StatefulWidget {
  const WatchPage({Key? key, this.args}) : super(key: key);

  final args;

  @override
  State<WatchPage> createState() => _WatchPageState();
}

class _WatchPageState extends State<WatchPage> {
  late VideoPlayerController? _controller = null;
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
        String path = _animeWatch?.headers?.referer ?? '';
        print(path);
        var uri = Uri.parse(path); // works correctly; has no percent-encoding
        _controller = VideoPlayerController.networkUrl(uri);
        print(_controller);
        // _controller = VideoPlayerController.networkUrl(
        //     Uri.parse(_animeWatch?.headers?.referer ?? ''))
        //   ..initialize().then((_) {
        //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        //     setState(() {});
        //   });
      }
      // setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _animeWatch == null && _controller == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: _controller!.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller!.value.aspectRatio,
                      child: VideoPlayer(_controller!),
                    )
                  : Container(),
            ),
      floatingActionButton: _animeWatch == null && _controller == null
          ? Container()
          : FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller!.value.isPlaying
                      ? _controller!.pause()
                      : _controller!.play();
                });
              },
              child: Icon(
                _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }
}
