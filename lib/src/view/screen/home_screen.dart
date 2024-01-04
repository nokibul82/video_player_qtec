import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player_qtec/src/view/widget/video_card_widget.dart';
import '../../controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: Text("Trending Videos",
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Obx(() {
        return homeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.onPrimary),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  homeController.refreshVideoList();
                },
                child: ListView.builder(
                  controller: homeController.scrollController,
                  shrinkWrap: true,
                  //physics: const BouncingScrollPhysics(),
                  itemCount: homeController.videoList.length,
                  itemBuilder: (context, index) {
                    if (index == homeController.videoList.length - 1 &&
                        homeController.hasMoreData.value == true){
                      return const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(child: CircularProgressIndicator(color: Colors.red,)),
                      );
                    }else{
                      return VideoCardWidget(
                        videoModel: homeController.videoList[index]
                      );
                    }
                  },
                ),
              );
      }),
    );
  }
}
