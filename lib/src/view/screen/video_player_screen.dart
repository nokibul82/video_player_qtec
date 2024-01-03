import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_qtec/src/view/widget/video_reaction_widget.dart';
import '../../model/video_model.dart';
import '../widget/video_player_widget.dart';

class VideoPlayerScreen extends StatelessWidget {
  final VideoModel videoModel;
  const VideoPlayerScreen({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: Get.height,
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
                      SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          VideoReactionWidget(
                            iconData: CupertinoIcons.heart,
                            text: "MASH ALLAH (12k)",
                          ),
                          VideoReactionWidget(
                            iconData: Icons.thumb_up_alt_outlined,
                            text: "LIKE (12k)",
                          ),
                          VideoReactionWidget(
                            iconData: CupertinoIcons.share_up,
                            text: "SHARE",
                          ),
                          VideoReactionWidget(
                            iconData: CupertinoIcons.flag,
                            text: "REPORT",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        leading: CircleAvatar(
                        foregroundImage: Image.network(
                      videoModel.channelImage,
                      fit: BoxFit.cover,
                        ).image),
                        title: Text(
                      videoModel.channelName,
                      style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                        '${videoModel.channelSubscriber}M Subscribers',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(color: Colors.grey)),
                        trailing: Container(
                      width: 109,
                      height: 33,
                      //padding: const EdgeInsets.only(top: 8, left: 12, right: 14, bottom: 8),
                      decoration: ShapeDecoration(
                        color: Color(0xFF3898FC),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Text(
                                  'Subscribe',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                        ),
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Comments   6.6K",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                          ),
                          const Icon(
                            CupertinoIcons.chevron_up_chevron_down,
                            size: 18,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      TextField(
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(5),
                            border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(6)),
                            hintText: "Add Comment",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.black54),
                                borderRadius: BorderRadius.circular(6)),
                            focusColor: Colors.blue,
                            suffixIcon: const Icon(
                              Icons.send_outlined,
                              size: 18,
                              color: Colors.black54,
                            )),
                      ),
                      ListTile(
                        leading: Image.asset('assets/images/Ellipse.png'),
                        title: Text("Fahmida khanom   2 days ago",style: Theme.of(context).textTheme.bodySmall,),
                        subtitle: Text("হুজুরের বক্তব্য গুলো ইংরেজি তে অনুবাদ করে সারা পৃথিবীর মানুষদের কে শুনিয়ে দিতে হবে। কথা গুলো খুব দামি",style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10,color: Colors.black87),),
                      )
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
