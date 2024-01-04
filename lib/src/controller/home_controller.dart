import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/api.dart';
import '../model/video_model.dart';

class HomeController extends GetxController {
  final isLoading = false.obs;
  var currentPage = 1;
  final videoList = List<VideoModel>.empty(growable: true).obs;
  final hasMoreData = true.obs;

  ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    getAllVideo();
    paginateVideo();
    super.onInit();
  }

  Future getAllVideo() async {
    try {
      videoList.value.clear();
      isLoading.value = true;
      var response =
          await http.get(Uri.parse("$url?page=$currentPage"), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final data = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
        if (data['results'] is List) {
          videoList.value = (data['results'] as List)
              .map((videoJson) => VideoModel.fromJson(videoJson))
              .toList();
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Error", "No Video found",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;
      print("=============== Error From getAllVideo ======================");
      print(e.toString());
    }
  }

  void paginateVideo() async{
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        print("reached end");
        currentPage++;
        await getMoreVideo(currentPage);
      }
    });
  }

  Future getMoreVideo(int currentPage) async {
    try {
      isLoading.value = true;
      var response =
          await http.get(Uri.parse("$url?page=$currentPage"), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        final data = json.decode(utf8.decode(response.bodyBytes))
            as Map<String, dynamic>;
        print('Next videos len: ${data['results'].length}');
        if (data['results'] is List && data['results'].length > 0) {
          hasMoreData(true);
          videoList.addAll((data['results'] as List)
              .map((videoJson) => VideoModel.fromJson(videoJson))
              .toList());
          Get.snackbar("Message", "Next Page Fetched",
              backgroundColor: Colors.white, colorText: Colors.black54);
        } else {
          hasMoreData(false);
          Get.snackbar("Message", "No more videos",
              backgroundColor: Colors.redAccent, colorText: Colors.white);
        }
      } else {
        isLoading.value = false;
        Get.snackbar("Message", "No more videos",
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.redAccent,
            colorText: Colors.white);
      }
    } catch (e) {
      isLoading.value = false;
      print("=============== Error From getMoreVideo ======================");
      print(e.toString());
    }
  }

  void refreshVideoList() async {
    currentPage = 1;
    getAllVideo();
  }
}
