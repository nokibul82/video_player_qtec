import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import '../../model/video_model.dart';

class VideoPlayerWidget extends StatefulWidget {
  final VideoModel videoModel;

  const VideoPlayerWidget({super.key, required this.videoModel});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late ChewieController _chewieController;
  bool _showControls = false;
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      materialProgressColors: ChewieProgressColors(
          backgroundColor: Colors.grey,
          handleColor: Colors.redAccent,
          playedColor: Colors.red,
          bufferedColor: Colors.white),
      videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(widget.videoModel.manifest),
          formatHint: VideoFormat.hls,
          videoPlayerOptions:
              VideoPlayerOptions(allowBackgroundPlayback: false)),
      aspectRatio: 16 / 9,
      autoInitialize: true,
        autoPlay: true,
      looping: false,
      placeholder: Image.network(widget.videoModel.thumbnail,fit: BoxFit.cover,)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Chewie(controller: _chewieController),
        ),
        _showControls
            ? Container(
                color: Colors.black54,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        _chewieController.seekTo(Duration(
                            seconds: _chewieController.videoPlayerController
                                    .value.position.inSeconds -
                                10));
                      },
                      icon: Icon(Icons.replay_10),
                      color: Colors.white,
                    ),
                    IconButton(
                      onPressed: () {
                        _chewieController.seekTo(Duration(
                            seconds: _chewieController.videoPlayerController
                                    .value.position.inSeconds +
                                10));
                      },
                      icon: Icon(Icons.forward_10),
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.videoPlayerController.pause();
    _chewieController.dispose();
  }
}
