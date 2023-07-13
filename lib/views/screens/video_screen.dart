import 'package:flutter/material.dart';
import 'package:news_app/views/widgets/customtextfield.dart';
import 'package:news_app/views/widgets/customtextfieldvideo.dart';
import 'package:news_app/views/widgets/videocard.dart';
import 'package:get/get.dart';
import '../../controllers/videocontroller.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});

  final videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Video',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          CustomTextFieldVideo(
            getcontroller: videoController,
            icon: Icon(Icons.video_collection),
          ),
          SizedBox(
            height: 25,
          ),
          Obx(() {
            if (videoController.videoData.value.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                  child: ListView.builder(
                      itemCount: videoController.videoData.value.length,
                      itemBuilder: ((context, index) => VideoCard(
                            videoId: videoController.videoData.value[index].id,
                            channel: videoController.videoData.value[index].channelTitle,
                            title: videoController.videoData.value[index].title,
                          ))));
            }
          })
        ],
      ),
    );
  }
}
