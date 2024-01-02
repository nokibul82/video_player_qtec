import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/video_model.dart';
import '../widget/video_player_widget.dart';

class VideoPlayerScreen extends StatelessWidget {
  final VideoModel videoModel;
  const VideoPlayerScreen({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                VideoPlayerWidget(
                  videoModel: videoModel,
                ),
                Card(
                  elevation: 0,
                  color: Colors.black12,
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_left,
                        color: Colors.white,
                      )),
                )
              ],
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      videoModel.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      '${videoModel.viewers} views . ${DateTime.now().difference(videoModel.createdAt).inDays} days ago',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
