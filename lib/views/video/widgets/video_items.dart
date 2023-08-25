import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/views/video/widgets/videocard.dart';
import '../../../controllers/videocontroller.dart';

class VideoItemsList extends StatelessWidget {
  const VideoItemsList({super.key});

  @override
  Widget build(BuildContext context) {
    final videoController = Get.put(VideoController());
    return Obx(() {
      if (videoController.videoData.isEmpty) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Expanded(
            child: ListView.builder(
                itemCount: videoController.videoData.length,
                itemBuilder: ((context, index) => VideoCard(
                      videoId: videoController.videoData[index].id,
                      channel: videoController.videoData[index].channelTitle,
                      title: videoController.videoData[index].title,
                    ))));
      }
    });
  }
}
