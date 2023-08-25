import 'package:flutter/material.dart';
import 'package:news_app/views/discover/widgets/customtextfield.dart';
import 'package:news_app/views/video/widgets/customtextfieldvideo.dart';
import 'package:news_app/views/video/widgets/videocard.dart';
import 'package:get/get.dart';
import '../../../controllers/videocontroller.dart';
import '../widgets/video_items.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});

  final videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Video',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          CustomTextFieldVideo(
            getcontroller: videoController,
            icon: const Icon(Icons.video_collection),
          ),
          const SizedBox(
            height: 25,
          ),
          const VideoItemsList()
        ],
      ),
    );
  }
}
