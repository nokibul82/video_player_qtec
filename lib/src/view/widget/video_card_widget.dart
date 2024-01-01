import 'package:flutter/material.dart';
import '../../model/video_model.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({super.key, required this.videoModel});
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(videoModel.thumbnail),
        title: Text(videoModel.title),
      ),
    );
  }
}
