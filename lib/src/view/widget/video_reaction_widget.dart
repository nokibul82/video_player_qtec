import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoReactionWidget extends StatelessWidget {
  const VideoReactionWidget(
      {super.key, required this.iconData, required this.text});
  final IconData iconData;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 2),
      margin: EdgeInsets.symmetric(horizontal: 2),
      decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(width: 1, color: Color(0xFFE2E8F0)))),
      child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [Icon(iconData), Text(text)],
      ),
    );
  }
}
