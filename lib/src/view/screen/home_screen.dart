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
        title: Text("Trending Videos",style:Theme.of(context).textTheme.titleLarge),
      ),
      body: Obx(() {
        return homeController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Theme.of(context).colorScheme.onPrimary),
              )
            : ListView.builder(
                shrinkWrap: true,
                //physics: const BouncingScrollPhysics(),
                itemCount: homeController.videoList.value.length,
                itemBuilder: (context, index) {
                  return VideoCardWidget(
                    videoModel: homeController.videoList.value[index],
                  );
                },
              );
      }),
    );
  }
}
