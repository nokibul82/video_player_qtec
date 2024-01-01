import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/video_model.dart';

class VideoCardWidget extends StatelessWidget {
  const VideoCardWidget({super.key, required this.videoModel});
  final VideoModel videoModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child:
      Container(
        width: 346,
        height: 290,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 17,
              top: 208.83,
              child: Container(
                width: 287,
                height: 66,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(videoModel.channelImage),
                                  fit: BoxFit.fill,
                                ),
                                shape: OvalBorder(),
                              ),
                            ),
                            const SizedBox(width: 12),
                            SizedBox(
                              width: 235,
                              height: 40,
                              child: Text(
                                videoModel.title,
                                style: const TextStyle(
                                  color: Color(0xFF1A202C),
                                  fontSize: 15,
                                  fontFamily: 'Mina-Regular',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 52,
                      top: 48,
                      child: Text(
                        '${videoModel.viewers} views  .   ${DateFormat.yMMMd().format(videoModel.createdAt)}',
                        style: TextStyle(
                          color: Color(0xFF718096),
                          fontSize: 13,
                          fontFamily: 'Mina-Regular',
                          fontWeight: FontWeight.w400,
                          height: 0.11,
                          letterSpacing: -0.26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 346,
                height: 192,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(videoModel.thumbnail),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 301.93,
              top: 169.32,
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: ShapeDecoration(
                        color: Colors.black.withOpacity(0.9200000166893005),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            videoModel.duration,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Mina-Regular',
                              fontWeight: FontWeight.w500,
                              height: 0.12,
                              letterSpacing: -0.24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 315,
              top: 216.83,
              child: Container(
                width: 24,
                height: 24,
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        width: 24,
                        height: 24,
                        child: const Icon(Icons.more_vert),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )


      // ListTile(
      //   leading: Image.network(videoModel.thumbnail),
      //   title: Text(videoModel.title,style: const TextStyle(fontFamily: 'Mina-Regular'),),
      // ),
    );
  }
}
