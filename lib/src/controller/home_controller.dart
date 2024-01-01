import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../constants/api.dart';
import '../model/video_model.dart';

class HomeController extends GetxController{
  final isLoading = false.obs;
  final currentPage = 1.obs;
  final videoList = Rx<List<VideoModel>>([]);

  @override
  void onInit() {
    getAllVideo();
    super.onInit();
  }

  Future getAllVideo() async {
    try {
      videoList.value.clear();
      isLoading.value = true;
      var response = await http.get(Uri.parse("$url?page=$currentPage"), headers: {
        "Accept": "application/json",
      });
      if (response.statusCode == 200) {
        isLoading.value = false;
        print(response.body.runtimeType);
        final data = json.decode(response.body) as Map<String,dynamic>;
        print(data.runtimeType);
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






}